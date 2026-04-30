%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% DAMTP specific documentation can be found at:
%  http://www.damtp.cam.ac.uk/internal/computing/tex/letterhead.html
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simon's Lab Letter Class for 2001
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simon Moore, University of Cambridge, Computer Laboratory
% Please use freely (it's just a hack!)
% Source from: http://www.cl.cam.ac.uk/~swm11/letters/index.html
% updated for use in DAMTP etc see above
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% $Id: damtplet.cls,v 1.8 2012/04/24 00:41:53 jp107 Exp $
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Class Options:
%  usebwarms    - uses a black and white version of the Univ. arms
%  usecmfont    - uses computer modern font rather than Sabon (works
%                 better with xdvi (see comment in re font-sizes)
%  usetimesfont - uses times font rather than Sabon
%  nofold       - don't mark the place to fold the letter (for
%                 standard university window envelopes)
%
%  e.g.:
%  \documentclass[usecmfont,usebwarms,usetimesfont]{mathslet}
%
% Compulsory commands:
%  \fromwhome{your name}{qualifications}{title}{email}{phone}{fax}
%  \begin{letter}{their name}{their address}
%  \end{letter}
%
% Extra commands:
%  \lettertitle{title of letter}
%  \setdate{date string}
%  \setsigned{greeting}{signature}
%  \setsalutation{salutation}
%  \cclist{list of people\\to cc the\\message to}
%  \enclosures{list of enclosures} 
%  \reference{reference string} 
%  \institution{institution to put at top of document, defaults to DAMTP}
%  \bwarms              % black and white arms
%
% No name version of letter (as letter but recipents name is not added
% to the address):
%  \begin{letternoname}{their name}{their address}
%  \end{letternoname}
%
\ProvidesClass{mathslet}[2013/07/10]
%\ProvidesClass{damtplet}[2013/07/10]
\typeout{Maths Letter Class -- based on Simon Moore's CL Letter Class}
% we probably shouldn't load this unless it is actually needed!
%%\usepackage{sabon}                % Univ. font is Sabon!
\usepackage{times} % pick times over Sabon for most people at home!
\renewcommand{\ttdefault}{cmtt}   % but don't use courier for typewriter
\usepackage{color}
\ifx\pdftexversion\undefined
 \usepackage[dvips]{graphicx}
 \DeclareGraphicsExtensions{.eps,.epsf}
% \typeout{In nonpdf section}
\else
 \usepackage[pdftex]{graphicx}
 \DeclareGraphicsExtensions{.pdf}
% \typeout{In pdf section}
\fi
%
% We need a size for the height of the institution font since we need to hack
% it in CM mode... (horrible! JSP)
\newlength\instsize
\setlength{\instsize}{14pt}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A few new options (rest are passed through to article class).

\DeclareOption{usebwarms}{\AtBeginDocument{\bwarms}}
\DeclareOption{usetimesfont}{\typeout{Replacing Sabon with Times}
  \AtEndOfClass{\usepackage{times}}}
\DeclareOption{usecmfont}{\typeout{Replacing Sabon with Computer Modern -- Note font-size for Department altered}
  \AtEndOfClass{\renewcommand{\rmdefault}{cmr}\setlength{\instsize}{13.6pt}
  \usepackage{type1cm}% to permit use of cmr at ANY size!
}}
\DeclareOption{nofold}{\typeout{Not putting in fold mark}
  \AtEndOfClass{\renewcommand{\dofold}{}}}
\DeclareOption{dlfold}{\typeout{Fold for DL envelopes is the default}}
\DeclareOption{c5fold}{\typeout{Using C5 fold mark}
  \AtEndOfClass{\renewcommand{\dofold}{\vbox to 0mm{\vskip 37.7truemm\hbox to 2truemm{\leaders\hrule\hfill}\vss}}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[11pt,a4paper]{article}

% page layout
\pagestyle{plain}
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0mm}
    % use -31mm for official skip, -25mm for window envelopes
\setlength{\topmargin}{-25mm}
\setlength{\textwidth}{16cm}
\setlength{\textheight}{265mm}  %235mm if address in footer
%\setlength{\footskip}{25mm}

\parskip 10pt
\parindent 0.0pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% main content commands
\newcommand{\fromnamedetails}{Use \\from to speficfy your name,
position, email, phone, fax}
\newcommand{\fromquoldetails}{your qualifications?}
\newcommand{\fromjobdetails}{your position?}
\newcommand{\fromemaildetails}{email?}
\newcommand{\fromphonedetails}{phone?}
\newcommand{\fromfaxdetails}{fax?}
\newcommand{\fromwhom}[6]{
        \renewcommand{\fromnamedetails}{#1}
        \renewcommand{\fromquoldetails}{#2}
        \renewcommand{\fromjobdetails}{#3}
        \renewcommand{\fromemaildetails}{#4}
        \renewcommand{\fromphonedetails}{#5}
        \renewcommand{\fromfaxdetails}{#6}
        }

\newcommand{\addressdetails}{Use \\towhom to set the name and address}
\newcommand{\towhomname}{Name?}

\newcommand{\referencedetails}{}
\newcommand{\reference}[1]{\renewcommand{\referencedetails}{#1}}

\newcommand{\datedetails}{\today}
\newcommand{\setdate}[1]{\renewcommand{\datedetails}{#1}}

\newcommand{\salutationdetails}{Dear \towhomname,}
\newcommand{\setsalutation}[1]{\renewcommand{\salutationdetails}{#1}}

\newcommand{\yoursdetails}{Yours sincerely,}
\newcommand{\signeddetails}{\fromnamedetails}

\newcommand{\setsigned}[2]{\renewcommand{\yoursdetails}{#1}\renewcommand{\signeddetails}{#2}}

\newcommand{\encldetails}{}
\newcommand{\enclosures}[1]{\renewcommand{\encldetails}{\vspace*{10em}\textbf{Encl}:~~\begin{minipage}[t]{100mm}#1\end{minipage}}}

\newcommand{\cclistdetails}{}
\newcommand{\cclist}[1]{\renewcommand{\cclistdetails}{\vspace*{1em}cc:~~\begin{minipage}[t]{100mm}#1\end{minipage}}}

\newcommand{\cuarms}{\includegraphics[height=12.5truemm]{CUarms_colour}}
\newcommand{\bwarms}{\typeout{Using B&W version of the arms}\renewcommand{\cuarms}{\includegraphics[height=12.5truemm]{CUarms_bw}}}

\newcommand{\dostamp}{}
\newcommand{\stamp}[1]{\renewcommand{\dostamp}{#1}}
\newcommand{\dofold}{\vbox to 0mm{\vskip -2truemm\hbox to 2truemm{\leaders\hrule\hfill}\vss}}

\newcommand{\doCAM}[1]{\fontsize{17.5pt}{18pt}\bf UNIVERSITY OF\par\fontsize{22pt}{22pt}\bf CAMBRIDGE\fontsize{\instsize}{16pt}\vskip 4truemm\bf#1}
%\newcommand{\doCL}{\doCAM{Computer Laboratory}}
%\newcommand{\myINST}{Department of\par Applied Mathematics and\par Theoretical Physics}
\newcommand{\myINST}{Centre for\par Mathematical Sciences}
\newcommand{\institution}[1]{\renewcommand{\myINST}{#1}}
\newcommand{\lettertitle}[1]{\begin{center}\bf#1\end{center}}
\newcommand{\myPOSTCODE}{CB3~0WA}
\newcommand{\setpostcode}[1]{\renewcommand{\myPOSTCODE}{#1}}

\newcommand{\dolettertop}{%
\setlength{\unitlength}{1mm}
\begin{picture}(160,80)(0,0)
\put(0,60){\makebox(160,20)[tl]{\parbox{\textwidth}{\bf\fromnamedetails\fromquoldetails\\\it\fromjobdetails}}}
\put(0,0){\makebox(100,41)[tl]{\begin{tabular}{@{}p{90mm}@{}}\addressdetails\end{tabular}}}
\put(0,10){\makebox(110,30.5)[tr]{\cuarms}}
%\put(0,10){\makebox(160,80.5)[tr]{\cuarms}}
\put(0,10){\makebox(175,30.5)[tr]{\parbox{60truemm}{\doCAM{\myINST}}}}
\put(0,60){\makebox(160,20)[tr]{\dostamp}}
\end{picture}

\datedetails\hfill\referencedetails \\
\hbox to 0pt{\hspace{-10mm}\dofold\hss}% Add hack fold line

\vspace*{1em}

\salutationdetails
%\let\@oddfoot\swmfoot
\thispagestyle{empty}%
\enlargethispage{10mm}%
\begin{figure}[b!]\swmfoot\end{figure}
}

\renewcommand{\footnoterule}{}
\renewcommand{\thefootnote}{}

\newcommand{\swmfoot}{\fontsize{9pt}{10pt}\rm\hfill\begin{tabular}{@{}l@{~~}l@{ }l@{}}
 & & \\
%\multicolumn{2}{@{}l@{}}{Department of}\\
%\multicolumn{2}{@{}l@{}}{Applied Mathematics and}\\
%\multicolumn{2}{@{}l@{}}{Theoretical Physics}\\
%\multicolumn{2}{@{}l@{}}{University of Cambridge}\\
\multicolumn{2}{@{}l@{}}{Centre for Mathematical Sciences}\\
\multicolumn{2}{@{}l@{}}{Wilberforce Road}\\
\multicolumn{2}{@{}l@{}}{Cambridge~~~\myPOSTCODE}\\
\multicolumn{2}{@{}l@{}}{U.K.}\\
 & \\
Tel: & \fromphonedetails\\
Fax: & \fromfaxdetails\\
E-mail: & \fromemaildetails\\
\end{tabular}%\let\@oddfoot\@empty
}

\newcommand{\doletterbottom}{

\begin{minipage}{150mm}%\textwidth}
\yoursdetails

\vspace{48pt}

\signeddetails

\encldetails

\cclistdetails

\end{minipage}
\cleardoublepage}

\newenvironment{letternoname}[2]
  {\renewcommand{\addressdetails}{#2}\renewcommand{\towhomname}{#1}\dolettertop}
  {\doletterbottom}

\newenvironment{letter}[2]
  {\renewcommand{\addressdetails}{#1\\#2}\renewcommand{\towhomname}{#1}\dolettertop}
  {\doletterbottom}
