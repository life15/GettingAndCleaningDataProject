# GettingAndCleaningDataProject
### 原始数据来源
[下载连接](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### 数据处理过程
1. 下载并解压原始数据包至脚本所在文件夹；
2. 脚本读取在/UCI_HAR_Dataset/test/X_test.txt和/UCI_HAR_Dataset/train/X_train.txt中的数据，保存至变量test和trian；
3. 读取原始数据的标签，保存至变量features；
4. 对featrues进行字符串处理，清楚原始数据标签的中"-()","-"的连接符；
5. 将处理后的features标签作为列名称添加至数据集test和train中；
6. 分别添加测试类型标签"TEST"和"TRAIN"至test$subject和train$subject，用于后续合并数据集时区分不同类型数据；
7. 读取并分别添加活动类型标签至test$activity和train$activity;
8. 合并test和trian数据集为data数据集；
9. 提取data数据中的mean和std值；
10. 使用文本header解释不同的活动类型；
11. 根据不同的测试和活动类型重新排列数据并保存为文本文件。
