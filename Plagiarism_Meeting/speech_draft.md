大家好，我对于今天的会议感到不可思议。因为我认为我的编程水平足够让我独立完成作业。下面我会逐条解释我的编程思路。

对于第一个问题，首先，正则表达式是一个很常规的过滤方式。我可以熟练使用python的re库，而且我很熟悉Perl编程语言，它以正则表达式著称，所以我并不认为我的正则表达式构成了抄袭。而且我可以使用多种写法对字符串进行过滤。而且众所周知，R语言并不擅长字符表达式的操作。其次，我想说的是有关switch()函数。有一个很简单的原因我使用它是因为我在高中就接受编程训练，我使用的第一门语言是Pascal。之后在接触信息学竞赛后被教授C语言，在培训中老师告诉我，如果if分支超过3个就应该将代码改为switch，如果switch分支超过10个就应该写成cofig，然后专门写函数来进行映射。我不认为原本循环速度很慢的R语言不需要switch函数。

第二个问题，我不认为我的方法是低效的。众所周知，正则表达式是转为自动机再进行匹配的，如果不需要查看编译时间，算法时间复杂度为O(n)，而一个哈希表进行散列时，拥有主键可以很容易地进行访问，这相当于直接操作一个指向内存值为需要值的指针然后顺序操作。但是理想哈希表是一个包含关键字的具有固定大小的数组，题中所给的情况完全会拖累指针操作。当关键字范围超过数组单元时，会产生散列冲突。无论这是否被判定为抄袭，我都希望坚持自己的代码。

第三个问题，我只给一个同学讲过，而且我认为我只讲了大概思路。我很不理解的就是我不清楚为什么这是最大的危险信号。一个很简单的原因就是eval函数或exec函数被广泛应用于python，JavaScript，和php等动态类型语言中，尤其是在弱类型语言中用于动态更新与代码注入方面。很显然这在我看来是我写的常规代码，这会省去很多不必要的打字时间，并且我只在我的生产环境中禁用此类函数，因为我害怕黑客用XSS注入攻击我自己的网站。我想再次声明的是R不是我接触的唯一一门语言，也不是我接触的最后一门语言，甚至我可以任性地说这是门我认为简单但是我不喜欢的语言。

对于第四个问题我想说的是这个正则表达式很轻松就可以写出来。而且我也不知道为什么有人要抄袭我的正则表达式，如果我提前知道这种情况，我甚至自己就可以把这个表达式更改为其他形式，而且不止一种。

对于第五个问题我并不清楚，因为我没有看过其他人的代码，而且我很自信我不需要看其他人的代码。我想在这里说一下我怎么接触到正则表达式的。Python的爬虫中抓取自己想要的部分有三种主流路径，第一种是写正则表达式，第二种是写xpath表达式，第三种是写css选择器。而在没有C语言封装的lxml库出现前，正则表达式无疑是最快的方式。所以我的正则表达式很熟练。

对于第六个问题我想说两点。第一，在第八题第ii部分中可以清楚地看到，我为了简化代码而使用了dplyr包中的管道操作符，而若使用ggplot2，我不得不去重构我的代码。原因很简单，如果你对管带操作符有一点了解，并且使用Linux操作系统，你会发现R语言的管道操作符和Shell的符号用法大体相同。并且均不支持传入实参，只能传入位置参数，所以我不认为我需要修改为ggplot2从而增加自己的工作量。第二，对于第9题iii部分，由于没有上述管道符的限制，我可以用这个包来进行美化。

最后我想说的是，有一个中国同学问我R语言和正则表达式该怎么学，我认为我需要也有责任教她这些在我看来非常基本的知识。我在计算机领域的偶像是Linux。他的开源精神与社区驱动的理念让我崇拜。他写出的Linux内核与git让无数人受用终生。而且我的全部代码记录都在Github中，如果你们感兴趣可以查看，有具体的提交时间与修改内容。你们也可以在GitHub上关注我，给我点赞。我学习统计专业而不是计算机的原因是我认为我的计算机水平不低于一个计算机的研究生，而且我希望以后如果我有机会攻读博士学位，我想给GitHub网站开源贡献自己的算法和代码。由于我没有及时对自己的网站域名进行续费，在GitHub上的网络暂时无法访问。我们程序员群体在GitHub上展示自己的代码，并热心地在Stack Overflow对其他人的问题进行解答并贡献出自己的代码绝对不是抄袭。这次的事件我认为我和平时做出的一样，教给别人如何去学一门计算机语言，如何用技巧来对问题进行分析与拆解。我并没有直接将我的论文交给任何人，而且我相信其他人即使不熟练，也能通过自己的努力做出这份作业。

现在我在自学C++的模版与元编程部分，如果老师们可以指导我我会很感激。另外，我自学了RCpp库，我在解题的时候因为老师在笔记中的代码太慢，所以我根据Seamless R and C++ Integration with Rcpp的代码进行了重构。我认为如果这种行为算抄袭的话，我不得不考虑今后如何编写我的代码了

这是我的Github地址，欢迎老师们对于提交时间进行核对。

以上是我今天答辩的全部内容，谢谢老师的耐心聆听。

Hello everyone, I am incredibly excited about today's session. Because I think my programming level is good enough for me to do the assignment independently. I will explain my programming ideas line by line below.

For the first question, first of all, regular expressions are a very conventional way of filtering. I can use python's re library proficiently, and I'm familiar with the Perl programming language, which is known for its regular expressions, so I don't think my regular expressions constitute plagiarism. And I can filter strings using a variety of writing styles. And it is well known that the R language is not very good at manipulating character expressions. The second thing I want to say is about the switch() function. There is a very simple reason why I use it because I was trained in programming in high school, and the first language I used was Pascal. then after being exposed to informatics competitions I was taught C. During my training I was told that if there were more than 3 if branches I should change the code to switch, and if there were more than 10 switch branches I should write cofig and then write specifically function to do the mapping. I don't think the otherwise slow looping R language doesn't need switch functions.

The second problem is that I don't think my approach is inefficient. As you know, regular expressions are converted to automata and then matched, and the algorithm time complexity is O(n) if you don't need to check the compilation time, while a hash table for hashing can be easily accessed by having a primary key, which is equivalent to directly manipulating a pointer to a memory value for the desired value and then sequentially manipulating it. But an ideal hash table is an array with a fixed size containing keywords, and the case given in the question would completely bog down pointer operations. When the keyword range exceeds the array cell, a hash conflict arises. Whether this is judged to be plagiarism or not, I would like to stick to my code.

The third problem is that I have only given it to one student and I think I have only covered the general idea. What I really don't understand is that I'm not sure why this is the biggest red flag. One simple reason is that eval or exec functions are widely used in dynamically typed languages like python, JavaScript, and php, especially in weakly typed languages for dynamic updates and code injection. Obviously this seems to me to be routine code that I write, which saves a lot of unnecessary typing, and I only disable such functions in my production environment because I'm afraid of hackers attacking my own website with XSS injection. I would like to state again that R is not the only language I have come across, nor is it the last language I will ever come across, even if I can arbitrarily say that it is a language I find easy but I don't like.

To the fourth question I would like to say that this regular expression can be written very easily. And I don't know why anyone would want to copy my regular expression, if I had known about it in advance I could have even changed it into other forms myself, and more than one.

I'm not sure about the fifth question, because I haven't looked at anyone else's code, and I'm pretty confident that I don't need to look at anyone else's code. I'd like to talk about how I came across regular expressions here. there are three mainstream paths in Python crawlers to grab the part you want, the first is to write regular expressions, the second is to write xpath expressions, and the third is to write css selectors. And before the advent of the C wrapper lxml library, regular expressions were definitely the fastest way. So I'm pretty proficient with regular expressions.

For the sixth question I would like to make two points. First, as you can clearly see in part ii of question 8, I used the pipe operator from the dplyr package to simplify my code, whereas if I had used ggplot2 I would have had to go and refactor my code. The reason for this is simple: if you know anything about pipe operators and use the Linux operating system, you will find that the R language's pipe operators are roughly the same as the Shell's symbolic usage. And neither supports passing in real parameters, only positional parameters, so I didn't think I needed to add to my workload by modifying to ggplot2. Secondly, for part iii of question 9, I can use this package for embellishment as there is no restriction on the piping operator as described above.

The last thing I would like to say is that a Chinese student asked me how to learn R and regular expressions, and I think I need and have a responsibility to teach her what seems to me to be very basic knowledge. My idol in computing is Linux, whose open source spirit and community-driven philosophy I admire. He wrote the Linux kernel and git, which has been used by countless people for the rest of their lives. And my entire code history is in Github if you're interested, with specific commit times and changes. You can also follow me on GitHub and give me a like. The reason I studied statistics instead of computing is that I don't think I'm any better than a graduate student in computing, and I hope to contribute my algorithms and code to GitHub open source in the future if I ever get a chance to do a PhD. The network on GitHub is temporarily inaccessible as I have not renewed my website domain name in time. It is definitely not plagiarism for us programmer community to showcase our code on GitHub and to enthusiastically answer other people's questions and contribute our own code on Stack Overflow. This incident I think I made the same as I usually do, teaching others how to learn a computer language and how to use techniques to analyse and break down problems. I did not give my paper directly to anyone and I am sure that others could have made this assignment on their own, even if they were not skilled.

I am now teaching myself the templates and metaprogramming part of C++ and I would be grateful if teachers could guide me. Also, I taught myself the Rcpp library and I refactored the code from Seamless R and C++ Integration with Rcpp when I was solving the problem because my teacher's code in his notes was too slow. I think I will have to consider how I write my code in the future if this behaviour counts as plagiarism

Here is my Github address, and teachers are welcome to check the submission times.

This is all I have to say in my defence today, thank you for your patience.

Translated with www.DeepL.com/Translator (free version)