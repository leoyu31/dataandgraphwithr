##添加误差线:使用geom_errorbar命令

ggplot(data, aes(x = parameter, y = sum_value)) +
    geom_bar(stat="identity", fill = color1, colour = color2， width = 0.9 )+   #stat="identity"
    geom_errorbar(aes(ymin = sum_value - se, ymax = sum_value + se), width = 0.2)

#一般fill可用白色, colour可用黑色


##添加显著性标记(字母)或其他数据标签:使用geom_text命令

ggplot() + geom_txt(aes(label = data$group 或label = c("a","b", "c")), vjust = -0.2 ~ 0.5)
#数据标签位于条形图上方


##修改坐标轴标签

ggplot() + xlab("aaaa") + ylab("bbbb")



##设置y轴的显示范围

ggplot + coord_cartesian(ylim = c(x, y))   # for contigeous values


##添加图表标题

ggplot + ggtitle("aaaaaa") + theme(plot.title = element_text(hjust = 0.5))  #hjust控制标题居中


##修改主题为黑色主题或经典主题：
ggplot + theme_bw() / theme_classic()
#注意主题命令的使用顺序

