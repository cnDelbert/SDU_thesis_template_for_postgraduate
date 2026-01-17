% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{sduthesis}[2015/05/12 v1.0.5 Shandong University Thesis Template for Postgraduate]
%------解决表格换行问题-------
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}  
%------解决表格换行问题-------

% ----- KVoptions Packages -----
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=SDU, prefix=SDU@opt@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{SDU}{#1}}

% ----- Declare Options -----
% ----- CHSstyle
\DeclareBoolOption[true]{chsstyle}
\DeclareComplementaryOption{nochsstyle}{chsstyle}
% ----- draft/print
\DeclareBoolOption[false]{print}
\DeclareComplementaryOption{noprint}{print}
% ----- double/single
\DeclareBoolOption[true]{double}
\DeclareComplementaryOption{single}{double}
% ----- Default Options
\DeclareDefaultOption{\PassOptionsToPackage{\CurrentOption}{ctexcap}}
% A4纸张大小，书记格式
\LoadClass[a4paper, 12pt]{book}
\ProcessKeyvalOptions*\relax

\ifSDU@opt@double\relax\else
	\PassOptionsToClass{openany}{book}
\fi
%------print------

%------中文支持------
\RequirePackage[UTF8, scheme=plain, heading=true]{ctex}
%----字体名
\RequirePackage{ifpdf,ifxetex}
\ifxetex
  \IfFontExistsTF{SimHei}
  {
    \newCJKfontfamily[heitiFakeBold]{\heitiFakeBold}{SimHei}[AutoFakeBold=2.5]
  }{
    \newcommand{\heitiFakeBold}{\heiti}
  }

  \IfFontExistsTF{Times New Roman}
  {
    \setmainfont{Times New Roman}
  }

\else
  \newcommand{\heitiFakeBold}{\heiti}
\fi
%------中文支持------

%------行距与缩进------
\linespread{1.38} % Approx 20pt fixed leading for Xiaosi (12pt)
\setlength{\parskip}{0pt}
\setlength{\parindent}{2em}
%------行距与缩进------

%------页面设置------
\ifSDU@opt@double
	\newcommand{\GeoOptions}{left=2.5cm, right=2.5cm, top=2.8cm, bottom=2.5cm, headsep=0.8cm, footskip=0.75cm, headheight=15pt}
\else
	\newcommand{\GeoOptions}{left=2.5cm, right=2.5cm, top=2.8cm, bottom=2.5cm, headsep=0.8cm, footskip=0.75cm, headheight=15pt}
\fi
\RequirePackage[\GeoOptions]{geometry}
%------页面设置------

%------页眉页脚------
\RequirePackage{fancyhdr}
%----清除设置----
\pagestyle{fancyplain}
\fancyhf{}
%----清除设置----

%----页眉划线----
\newcommand{\makeheadrule}{%
\makebox[0pt][l]{\rule[.7\baselineskip]{\headwidth}{0.8pt}}%
\rule[0.85\baselineskip]{\headwidth}{1.5pt}\vskip-.8\baselineskip}

\makeatletter
\renewcommand{\headrule}{%
{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\makeheadrule}}
\makeatother
%----页眉划线----

%----眉脚内容----
% ----------页眉----------
\pagestyle{fancy}
\fancyhf{}
\makeatletter
\ifSDU@opt@chsstyle
\chead{\centering\songti\zihao{5}\the\ThesisHeader}% 山东大学硕士学位论文
\else
\chead{\centering\small \the\EThesisHeader}
\fi
\makeatother
% ----------页脚----------
\cfoot{\centering\zihao{5}\thepage}  % 页码居中显示，Times New Roman 五号
%\fancyfoot[LE,RO]{--{~\thepage~}--}   % 页码居外侧显示
%----眉脚内容----
%------页眉页脚------

%------数学支持------
\RequirePackage{amsmath}
\RequirePackage{mathtools}
% 公式编号带点
\newtagform{dotted}[\dotfill]{(}{)}
\usetagform{dotted}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsbsy}
\RequirePackage{bm}
\RequirePackage{mathrsfs}
% Fix font size warnings for mathrsfs
\DeclareFontFamily{U}{rsfs}{\skewchar\font127 }
\DeclareFontShape{U}{rsfs}{m}{n}{%
  <-6> rsfs5
  <6-8> rsfs7
  <8-> rsfs10
}{}
\newcommand*{\me}{\ensuremath{\mathrm{e}}}				%自然对数的底
\newcommand*{\mi}{\ensuremath{\mathrm{i}}}				%虚数单位
\newcommand*{\dif}{\ensuremath{\,\mathrm{d}}}			%微分算子
\DeclareMathAlphabet{\mathsfsl}{OT1}{cmss}{m}{sl}
\newcommand*{\VEC}[1]{\ensuremath{\boldsymbol{#1}}}		%向量
\newcommand*{\MATRIX}[1]{\ensuremath{\mathsfsl{#1}}}	%矩阵名称
\newcommand*{\TENSOR}[1]{\ensuremath{\mathsfsl{#1}}}	%张量名称
\newcommand*{\HUA}[1]{\ensuremath{\mathscr{{#1}}}} 		%输出花体字母
\newcommand*{\SHUANG}[1]{\ensuremath{\mathbb{{#1}}}}	%输出双线字母
\numberwithin{equation}{chapter}						%公式编号随section变化
%------数学支持------

%------图表支持------
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{bicaption}
\DeclareCaptionFont{cfFive}{\zihao{5}\songti}
\DeclareCaptionFont{efFive}{\zihao{5}\rmfamily}
\captionsetup{labelsep=quad,skip=6pt,justification=centering}
\captionsetup[bi-first]{font={cfFive,stretch=1.0}}
\captionsetup[bi-second]{font={efFive,stretch=1.0}}
\captionsetup[figure][bi-second]{name=Fig.}
\captionsetup[table][bi-second]{name=Tab.}
%----图档搜索路径----
\graphicspath{{figures/}{figure/}{pictures/}{picture/}{pic/}{pics/}{image/}{images/}}
%----图档搜索路径----
\RequirePackage{booktabs}
%%----表格行距----
%\renewcommand\arraystretch{1.3}
%%----表格行距----
%----编号----
\numberwithin{figure}{chapter}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\numberwithin{table}{chapter}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
%----编号----
%----不浮动----
\makeatletter
\newcommand{\figcaption}{\def\@captype{figure}\caption}
\newcommand{\tabcaption}{\def\@captype{table}\caption}
\makeatother
%----不浮动----
%------图表支持------

%------交叉引用------
\RequirePackage{hyperref}
\hypersetup{unicode}
\hypersetup{colorlinks=true}
\hypersetup{linkcolor=black}
\makeatletter
\ifSDU@opt@print
	\hypersetup{allcolors=black}
\else\relax\fi
\makeatother
%------交叉引用------

%--------目录-------------
\makeatletter
\def\@bfdottedtocline#1#2#3#4#5{%
\ifnum #1>\c@tocdepth \else
  \vskip \z@ \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
   \parindent #2\relax\@afterindenttrue
   \interlinepenalty\@M
   \leavevmode \bfseries
   \@tempdima #3\relax
   \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
   {#4}\normalfont\nobreak
   \leaders\hbox{$\m@th
      \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
      mu$}\hfill
   \nobreak
   \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
   \par}%
\fi}
\renewcommand*\l@chapter{\@bfdottedtocline{0}{0em}{1.5em}}
\makeatother
%--------目录-------------

%—————————English Contents—————————————
\makeatletter
\newcommand\engcontentsname{Contents}
\newcommand\tableofengcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\engcontentsname
        \@mkboth{%
           \MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}}%
    \@starttoc{toe}% !!!!Define a new contents!!!!
    \if@restonecol\twocolumn\fi
    }
\newcommand\addengcontents[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}}
\makeatother

\newcommand\echapter[1]{\addengcontents{chapter}{#1}}
\newcommand\esection[1]{\addengcontents{section}{#1}}
\newcommand\esubsection[1]{\addengcontents{subsection}{#1}}
\newcommand\esubsubsection[1]{\addengcontents{subsubsection}{#1}}
%—————————English Contents—————————————

%------参考文献------
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
%------参考文献------

%------摘要环境------
\newcommand\enabstractname{ABSTRACT}
\newcommand\enkeywordsname{Key words}
\newcommand\enkeywords[1]{\vspace{1cm}\noindent{\bfseries\zihao{-4}\enkeywordsname: }#1}
\newenvironment{enabstract}{%
	\newpage
%	\centering
%	\begin{minipage}{.9\textwidth}
%	\centerline{\zihao{-3}\bfseries\enabstractname}\vspace{.3cm}
%	\centering
%	\begin{minipage}{.85\textwidth}	%20150305 COMMENT%
	\phantomsection
	\centerline{\vspace{.3cm}\zihao{-3}\bfseries\enabstractname}\vspace{.3cm}
	\addcontentsline{toc}{chapter}{ABSTRACT} %使目录中以章级别显示“Abstract”
	\addcontentsline{toe}{chapter}{ABSTRACT}
	\setlength{\parindent}{1.2em}
}{
%\end{minipage}
%\end{minipage}
\clearpage
}

\newcommand\cnabstractname{摘\texorpdfstring{\quad}{ }要}
\newcommand\cnkeywordsname{关键词}
\newcommand\cnkeywords[1]{\vspace{1cm}\noindent{\bfseries\zihao{-4}\cnkeywordsname: }#1}
\newenvironment{cnabstract}{%
	\newpage
%	\centering
%	\begin{minipage}{.9\textwidth}
%	\centerline{\zihao{-3}\bfseries\cnabstractname}\vspace{.3cm}
%	\centering
%	\begin{minipage}[c]{.85\textwidth}
	\phantomsection
	\centerline{\vspace{.3cm}\zihao{-3}\bfseries\cnabstractname}\vspace{.3cm} %20150305 ADD%
	\addcontentsline{toc}{chapter}{摘\texorpdfstring{\quad}{ }要} %使目录中以章级别显示“摘要”
	\addcontentsline{toe}{chapter}{Chinese Abstract}
	\setlength{\parindent}{2em}
	\zihao{-4}
}{
%\end{minipage}
%\end{minipage}
\clearpage
}
%------摘要环境------

%------中文风格------
\makeatletter
\ifSDU@opt@chsstyle
%----标题与日期----
\ctexset{
    figurename={图},
    tablename={表},
    bibname={参考文献},
    contentsname={目\texorpdfstring{\quad}{ }录},
    today=small,
    chapter = {
        name={第,章},
        number={\chinese{chapter}},
        format={\centering\linespread{1.0}\selectfont\heiti\zihao{-3}\bfseries},
        nameformat={},
        titleformat={},
        aftername={\hspace{1em}},
        beforeskip={24pt},
        afterskip={18pt},
        fixskip={true}
    },
    section = {
        format={\linespread{1.0}\selectfont\heiti\zihao{4}\bfseries},
        beforeskip={24pt},
        afterskip={6pt},
        fixskip={true}
    },
    subsection = {
        format={\linespread{1.0}\selectfont\heiti\zihao{-4}\bfseries},
        beforeskip={12pt},
        afterskip={6pt},
        fixskip={true}
    },
    subsubsection = {
        format={\flushleft\zihao{-4}}
    },
    appendix = {
        name={附录~},
        number={\Alph{chapter}}
    }
}
%----标题与日期----
%----章节样式----
%----------致谢---------------------
\newcommand{\acknowledgment}
{
	\clearpage  %加这个命令后，目录中的页码才显示正确
	\phantomsection %加这个命令后，目录中的超链接才指向正确的页码	
	\chapter*{致\hspace{4ex}谢} %开始一段不带编号的章
	\addcontentsline{toc}{chapter}{致\texorpdfstring{\quad}{ }谢} %使目录中以章级别显示“致谢”
	\addcontentsline{toe}{chapter}{Acknowledgement}
}
%----------致谢---------------------
%----章节样式----
%----首行缩进----
\RequirePackage{indentfirst}
%----首行缩进----
\else\relax\fi
\makeatletter
%------中文风格------

%------封面------
\input{sduthesis-front-cover.def}
%------封面------

%------声明------
\input{sduthesis-statement.def}
%------声明------

%------Make------
\newcommand{\maketitlepagestatement}{%
  \maketitlepage
  \thispagestyle{empty}
  ~
  \vfill\eject
  \thispagestyle{empty}
  \makestatement
  \vfill\eject
  \thispagestyle{empty}
  ~
  \vfill\eject
  \setcounter{page}{1}
}
\newcommand{\maketableofcontents}{%
    \pagenumbering{roman}
    \tableofcontents
    \ifSDU@opt@double
        \cleardoublepage
    \else
        \clearpage
    \fi
 %   \pagenumbering{arabic}\setcounter{page}{1}
}
%------Make------
%------脚注设置------
\RequirePackage[perpage]{footmisc}
\renewcommand{\footnotesize}{\zihao{-5}}
\renewcommand{\thefootnote}{\arabic{footnote}}
\makeatletter
\renewcommand\@makefntext[1]{%
  \parindent 0em%
  \linespread{1.0}\selectfont
  \noindent
  \hb@xt@ 1.5em{\hss\@makefnmark}#1}
\makeatother
%------脚注设置------

%------表格说明设置------
\newcommand{\tablenote}[1]{%
  \vspace{0pt}%
  \begingroup
  \zihao{5}\songti
  \setlength{\parindent}{2em}%
  \linespread{1.6}\selectfont % 20pt / 12.5pt (approx for Wuhao)
  \noindent #1\par
  \endgroup
}
%------表格说明设置------

\endinput

%------载入宏包------
%--中文支持
ctex
%--页面设置
geometry
%--页眉页脚
fancyhdr
%--数学支持
amsmath
amsfonts
amsthm
amssymb
amsbsy
bm
mathrsfs
%--图表
graphicx
booktabs
amsmath
%------载入宏包------
