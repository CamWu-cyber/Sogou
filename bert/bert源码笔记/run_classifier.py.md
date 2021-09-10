## 入口

tf.app.run()的作用：先处理flag解析，然后执行main函数

## main(\_)函数的内容

1. 小写flags的作用是定义变量的，比如flags.DEFIN_string就定义了一个string类型的变量，括号里面第一个参数是变量名，第二个变量是默认值，第三个参数是描述；
2. 大写FLAGS的作用是后续调用小写flags定义好的变量；
3. tf.logging.info() == print()；
4. tf.gfile.MakeDirs()创建目录；
5. FullTokenizer的作用是对一个文本段进行BasicTokenizer和WordpieceTokenizer两种解析，最后返回词（字）的数组，同时还提供token到id的索引以及id到token的索引。这里的token可以理解为文本段处理过后的最小单元；
6. tpu的使用，一般不会用，可不管此段代码。不使用tpu，会默认使用GPU；
7. bert中不再使用Session.run()来操作网络，而是使用Estimator这个高级API，Estimator的主要作用将训练，验证，测试的管理抽象起来，并且简单化，形成一个范式，用户可以通过实现对应的部分，从而使得模型的管理便捷起来；
8. estimator.train()中input_fn用来接收数据，max_steps用来定义最大步数；
9. 验证的时候，需要保证验证集样本的数量是batch size的整数倍的，否则验证失败，为了避免这种情况的发生，源代码里面会检测一下，如果发现不是整数倍的话，就往数据集里面加入一些fake examples，并且这些fake examples不会对后面的权重计算产生影响，请放心使用；
10. 预测阶段。读取验证数据，写入验证结果到test_results.tsv；

...

## TPUEstimator改为普通的Estimator

1. 910行。将 TPUEstimator 收到改成普通的 Estimator 实现，并且成功地获得正常的日志输出；
2. 930行。将 TPUEstimator 收到改成普通的 Estimator 实现后，train_input_fn需要添加batch_size；
3. 924行。将 TPUEstimator 收到改成普通的 Estimator 实现后，file_based_input_fn_builder()需要添加一个参数batch_size；
4. 571行。将 TPUEstimator 收到改成普通的 Estimator 实现后，batch_size的值由传入的参数获取，不再从params里面获取了；
5. estimator 会调用model_fn实现不同的mode（ModeKeys.TRAIN，ModeKeys.EVAL，ModeKeys.PREDICT），返回不同的EstimatorSpec；
6. 711行。之前添加的“训练日志方式”过增加loghook的方式定时打印需要的log，但是即使这样日志还是多条才看能到一次loss。于是我将 TPUEstimator 收到改成普通的 Estimator 实现，并且成功地获得正常的日志输出；

## 三个重要的模块

![image](https://github.com/CamWu-cyber/Sogou/blob/main/bert/images/key%20parts.png)
