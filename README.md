# 山东大学硕士/博士研究生毕业论文模板

本论文模板在 CTeX 2.9.2 环境下编译通过。

## 模板参照

- [关于印发《山东大学学位论文规范（试行）》的通知](http://www.grad.sdu.edu.cn/getNewsDetail.site?newsId=36c1b735-e0a2-4018-9fb6-7dfb8fb10a39)，2007-09-19，查阅日期：2016年10月2日。
- [关于使用新版博士、硕士学位论文封面的通知及封面填写要求](http://www.grad.sdu.edu.cn/getNewsDetail.site?newsId=a3b4f913-db00-449e-b61e-d48524ded89e)， 2012-04-13，查阅日期：2016年10月2日。

## 模板特点

本模板完全参照《山东大学学位论文规范（试行）》完成，同时针对理工科学位做了调整，满足毕业论文的撰写要求。

在之前版本基础上修复 bug 若干：

- 修改论文封面。
- 论文封面增加新的字段。
- 增加英文摘要、中英文关键字。
- 修复摘要 `minipage` 无法换页的问题。
- 按要求修改页码显示方式。
- 单页只能有两张图片的 bug。
- 增加致谢、参考文献等章节。
- 设置某些特定章节在目录中不参与编号。
- 修复双页打印问题。
- 使用 `tabincell` 完成表格内换行，多行表格可垂直居中。
- 使用 `wrapfigure` 并添加 `wrapfig` 包。
- 修复复制时英文字符映射为乱码的问题。
- 修复目录页为 `minipage` 导致目录显示不全的问题。
- 从目录中移除目录项 `nottoc` 参数。
- 增加英文目录。
- 修复目录页 `section` 等字段不显示点号的问题。
- 去掉正文前 `section` 前的双 S 符号。
- 增加定理定义等命令定义。
- ……

特别感谢[ChenMeng0518](https://github.com/ChenMeng0518/sduthesis)同学提供学士学位论文模板。

## 编译环境

请使用 CTeX 套装进行编译，需要 `xelatex` 和 `pdflatex` 命令支持。

如果你的 CTeX 套装中 ctex 包为 1.02c 或更早的版本，请将`SDUthesistemplate.tex`当中下面这句话取消注释：

```latex
% \expandafter\def\csname CTEX@spaceChar\endcsname{\hspace{1em}}
```

## 代码结构

- `sduthesis-front-cover.def`： 封面。
- `sduthesis-statement.def`： 原创性声明。
- `SDUthesistemplate.tex`： 主文件，你的论文结构在此文件当中。
- `sduthesis.cls`： 论文样式文件。
- `fonts-file/`： 字体文件路径(目前没用)。
- `figures/`： 图片存放路径，你也可以创建`figure`/`pictures`/`picture`/`pic`/`image`等路径。
- `contents/`： 论文所在路径。其中`usersettings.tex` 为整个项目的设置。

## 怎样编译

文档使用 XeLaTeX 进行编译。这要求所有参与编译的文档必须使用 UTF8 编码格式，因此建议你新建的任何参与编译的 `.tex` 文件都必须使用 UTF-8 编码，使用 `% !Mode:: "TeX:UTF-8"` 声明文档编码格式。

- 运行 `run.bat` 即可编译生成 pdf 文件。
- 在运行失败时使用 `clean.bat` 清理项目。
- 运行 `run_open.bat` 在编译完成之后打开 pdf 文件。

### 打印

将编译生成的 pdf 文件直接打印即可，注意要求打印社使用双面打印。

## 获取与更新

请到项目的 GitHub 页获取： <https://github.com/cnDelbert/SDU_thesis_template_for_postgraduate>。

### LICENSE

使用署名-非商业性使用 3.0协议，如果你使用了本论文模板，请务必提及。

该项许可协议允许他人基于非商业目的对您的作品重新编排、节选或者以您的作品为基础进行创作。尽管他们的新作品必须注明您的姓名并不得进行商业性使用，但是他们无需在以您的原作为基础创作的演绎作品上适用相同类型的许可条款。

- 这是一份普通人可以理解的许可协议概要：<https://creativecommons.org/licenses/by-nc/3.0/cn/deed.zh>。
- 这是对应的法律文本：<https://creativecommons.org/licenses/by-nc/3.0/cn/legalcode>。
