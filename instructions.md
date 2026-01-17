# 山东大学研究生学位论文 LaTeX 模板使用指南

欢迎使用本 LaTeX 模板！如果您是第一次使用 LaTeX，不用担心，本文档将为您提供详细的操作指南，帮助您快速上手。

## 1. 快速入门 (Quick Start)

1.  **编译入口**: 整个项目的入口文件是 `SDUthesistemplate.tex`。在 Overleaf 或本地编辑器中，请总是编译这个文件。
2.  **编译方式**: 请务必设置编译器为 **XeLaTeX**（因为它对中文支持最好）。
3.  **核心内容**: 您只需要关注 `contents/` 文件夹下的文件，论文的正文、摘要、图片引用等都在这里修改。

---

## 2. 项目结构说明

- **`SDUthesistemplate.tex`**: 主控文件。它像一个“骨架”，负责把各个章节（文件）组合在一起。一般**不需要修改**里面的代码，除非你要增减章节。
- **`sduthesis.cls`**: 样式定义文件。这里定义了字体、页边距、页眉页脚等格式。**非必要请勿修改**。
- **`contents/` 文件夹**: 存放您论文的具体内容。
    - `titlepageinfo.tex`: **必填**。填写论文题目、作者、导师、日期、密级等封面信息。
    - `abstract.tex`: 填写中英文摘要。
    - `ch1.tex`, `ch2.tex`, ... : 各章的正文文件。
    - `bib.tex`: 参考文献数据。
    - `acknowledgement.tex`: 致谢。
    - `appendix.tex`: 附录。
    - `usersettings.tex`: 如果您需要引入特殊的宏包，请在这里添加。

---

## 3. 如何编写内容（常用标签详解）

在 LaTeX 中，命令通常以 `\` 开头，环境通常以 `\begin{...} ... \end{...}` 包裹。

### 3.1 章节与标题
在 `contents/ch1.tex` 等文件中编写：

```latex
% 一级标题（章）
\chapter{绪论}
\echapter{Introduction} % 对应的英文标题（用于生成英文目录）

% 二级标题（节）
\section{研究背景}
\esection{Background}

% 三级标题（小节）
\subsection{具体问题}
\esubsection{Specific Problems}
```

### 3.2 段落与换行
- **分段**: 在源代码中**空一行**，编译出来的效果就是另起一段（首行会自动缩进）。
- **换行**: 如果只想换行但不分段（不缩进），可以使用 `\\`，但在正文写作中极少使用，建议始终用“空一行”来分段。

### 3.3 插入图片 (双语标题)
我们将图片文件放在 `figures/` 文件夹中。使用 `figure` 环境插入：

```latex
\begin{figure}[htbp] % [htbp] 是位置参数，意思是尽量按 Here, Top, Bottom, Page 的顺序自动排版
    \centering % 图片居中
    % 插入图片，width=0.8\textwidth 表示宽度设为版心宽度的 80%
    \includegraphics[width=0.8\textwidth]{example.jpg}
    
    % 双语标题：\bicaption{中文名}{英文名}
    % 注意：我们已经配置好，它会自动生成 "图 1-1 中文名" 和 "Fig. 1-1 English Name"
    \bicaption{系统流程图}{System Flowchart}
    
    % 标签：用于在文中引用这张图
    \label{fig:flowchart} 
\end{figure}
```

**在文中引用图片**:  
“如图 \ref{fig:flowchart} 所示...” -> 编译后显示为 “如图 2-1 所示...”

### 3.4 插入表格 (三线表 + 双语标题)
科技论文推荐使用三线表（只有顶线、底线和栏目线）。

```latex
\begin{table}[htbp]
    \centering % 表格居中
    % 双语标题
    \bicaption{实验结果对比}{Comparison of Experimental Results}
    \label{tab:results} % 标签
    
    % ccc 表示三列都是居中对齐 (center)
    % l 表示左对齐 (left)，r 表示右对齐 (right)
    \begin{tabular}{ccc} 
        \toprule % 顶线（粗线）
        实验组 & 准确率 (\%) & 召回率 (\%) \\
        \midrule % 中线（细线）
        方法 A & 85.2 & 78.5 \\
        方法 B & 92.1 & 88.3 \\
        \bottomrule % 底线（粗线）
    \end{tabular}
\end{table}
```

### 3.5 数学公式
**行内公式**:  
夹在文字中间的公式，用 `$` 符号包裹。  
例如：`我们定义函数 $f(x) = x^2$ 表示...`

**独占一行的公式 (带编号)**:  
请使用 `equation` 环境，这样公式右侧会自动生成序号 (2-1)。

```latex
\begin{equation}
    J(\theta) = \frac{1}{2m} \sum_{i=1}^{m} (h_\theta(x^{(i)}) - y^{(i)})^2
    \label{eq:cost_func} % 标签
\end{equation}
```

**引用公式**:  
“由公式 \ref{eq:cost_func} 可推导出...”

### 3.6 参考文献
目前模板使用手动录入方式，在 `contents/bib.tex` 文件中：

```latex
\begin{thebibliography}{99}

    % \bibitem{引用标签} 文献详细信息
    \bibitem{resnet} He K, Zhang X, Ren S, et al. Deep residual learning for image recognition[C]//Proceedings of the IEEE conference on computer vision and pattern recognition. 2016: 770-778.

    \bibitem{bert} Devlin J, Chang M W, Lee K, et al. Bert: Pre-training of deep bidirectional transformers for language understanding[J]. arXiv preprint arXiv:1810.04805, 2018.

\end{thebibliography}
```

**在文中引用**:  
“根据 He 等人的工作\cite{resnet}，残差网络...” -> 显示为 “根据 He 等人的工作[1]...”

---

## 4. 常见符号备忘

- **加粗**: `\textbf{文字}`
- **斜体**: `\textit{文字}`
- **下划线**: `\underline{文字}`
- **百分号**: `%` 是特殊字符（注释符），如果要在文中显示 %，必须写成 `\%`。
- **下划线符号**: `_` 是数学下标符，如果在文本中出现（如文件名），必须写成 `\_`。

## 5. 遇到问题怎么办？
1.  **警告 (Warning)**: 通常可以忽略，不影响生成 PDF。
2.  **错误 (Error)**: 编译失败。通常是因为拼写错误（如命令拼错）、漏掉了 `}`、或者在中文环境下使用了英文标点导致某些命令失效。
3.  **清理缓存**: 如果修改了配置却没生效，尝试删除辅助文件（`.aux`, `.toc` 等）后重新编译。

祝您写作顺利！
