本项目是基于Google bert的基础上修改的代码，优化了以下问题：

    1.训练过程由控制台输出改为了日志输出，好处是日志可以保留，方便后续查看；

    2.将 TPUEstimator 收到改成普通的 Estimator 实现，并且成功地获得正常的日志输出。否则会生成很多的没必要的日志信息；
    
    3.增加了precision, recall, f1在验证结果中；

**目前只修改了run_classifier.py**

具体的训练过程细节，跟Google bert上面是一样的，这里就不写了。

#### 简介
本项目是基于bert的句子对匹配项目，label有两个0和1，0表示不匹配，1表示匹配。

#### 数据
训练、验证、测试数据均在data/datasets中

原始数据格式是txt，但是bert的格式要求是tsv，txt转tsv的代码网上查查就有了。日后要使用模型的话，都需要这么转换一下格式。

#### 训练&验证
sh run.sh

最后在日志里会有验证的结果，同时在data/model_output/eval_results.txt里面也会有相同的结果。

![image](https://github.com/CamWu-cyber/Sogou/blob/main/bert/images/eval_re.png)

#### 测试
sh test.sh

测试结果会在data/model_output/test_results.tsv.

每一行代表一个样本，每一列代表每个label对应的概率，如果1的概率大于0的概率，说明是匹配的。

![image](https://github.com/CamWu-cyber/Sogou/blob/main/bert/images/test.png)

#### References

入门教程：

https://ganjinzero.github.io/2019/02/28/%E7%AE%80%E6%98%93%E6%95%99%E7%A8%8B%EF%BC%9A%E4%BD%BF%E7%94%A8Bert%E9%A2%84%E8%AE%AD%E7%BB%83%E6%A8%A1%E5%9E%8B%E6%96%87%E6%9C%AC%E5%88%86%E7%B1%BB/

官方文档：

https://github.com/google-research/bert
