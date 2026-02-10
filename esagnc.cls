% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%    ESAGNC.CLS: A LaTeX class file for manuscript submission to the ESA    %
%    GNC 2020 conference.                                                   %
%                                                                           %
%                                    %                                      %
%                                                                           %    
%    Copyright (C) 2020     Duarte Rondao                                   %
%                           d.rondao[at]cranfield.ac.uk                     %
%                                                                           %
%                                    %                                      %
%                                                                           %
%    History                                                                %
%    2020/03/01     Original version.                                       %
%                                                                           %
%                                    %                                      %
%                                                                           %
%    This program is free software: you can redistribute it and/or modify   %
%    it under the terms of the GNU General Public License as published by   %
%    the Free Software Foundation, either version 3 of the License, or      %
%    (at your option) any later version.                                    %
%                                                                           %
%    This program is distributed in the hope that it will be useful,        %
%    but WITHOUT ANY WARRANTY; without even the implied warranty of         %
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          %
%    GNU General Public License for more details.                           %
%                                                                           %
%    You should have received a copy of the GNU General Public License      %
%    along with this program.  If not, see <https://www.gnu.org/licenses/>. %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

%% Class description and inheritance ----------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esagnc}[2020/03/01 ESA GNC Conference Article Class]

%  Inherit from "article" class, 12 pt required.
\LoadClass[12pt]{article}

%% Fonts general ------------------------------------------------------------
%  Use T1 encoding and UK English rules.
\RequirePackage[T1]{fontenc}
\RequirePackage[UKenglish]{babel}

%  Times New Roman for body and maths.
\RequirePackage{newtxtext,newtxmath}

%% Paper geometry setup -----------------------------------------------------
%  2cm/0.79 in margins; bottom slightly taller to account for footer.
\RequirePackage[a4paper,%
                left=2cm,%
                right=2cm,%
                top=2cm,%
                bottom=3cm]
                {geometry}

%  Set single line spacing; no automatic indentations.
\RequirePackage{setspace}
\singlespacing
\setlength\parindent{0pt}

%  Compliance for enumitem lists.
\RequirePackage{enumitem}
\setitemize{noitemsep}

%% Title page setup ----------------------------------------------------------
%  Bold title 12 pt, 1 line before, 2 after.
\makeatletter         
\renewcommand\maketitle{
    {\raggedright 
    \begin{center}
        \vspace*{1\baselineskip}
        {\fontsize{12pt}{12pt}\bfseries \@title }\\ \vspace*{2\baselineskip}
        {\fontsize{12pt}{12pt} \@author}\\  \vspace*{1\baselineskip}
    \end{center}}} 
\makeatother

%  Boldface author names; italicised affiliations.
\RequirePackage{authblk}
\setcounter{Maxaffil}{0}
\renewcommand\Affilfont{\normalfont\itshape}
\renewcommand\Authfont{\bfseries}

%% Abstract setup ------------------------------------------------------------
%  Capitalise heading; change the default "quotation" to "quote" to remove
%  indentation.
\makeatletter   
\renewenvironment{abstract}{%
    \begin{center}%
        {\bfseries ABSTRACT}%
    \end{center}%
    \quote
    }
    \endquote
\makeatother

%% Footer setup -------------------------------------------------------------
%  Author name command.
\newcommand{\footauth}[1] {
  \fancyfoot[L]{\textit{ESA GNC 2026 – #1}}
}

%  Add text and page number.
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{}
\fancyfoot[R]{\thepage}
\renewcommand{\footrulewidth}{3pt}

%  Add blue footer ruler.
\RequirePackage{xcolor}
\definecolor{esablue}{RGB}{79,129,189}
\futurelet\TMPfootrule\def\footrule{{\color{esablue}\TMPfootrule}}

%% Heading setup ------------------------------------------------------------
%  12 pt for main headings; 11 pt for subheadings; 2 lines before, 1 after.
\RequirePackage{titlesec}
\titleformat{\section}
  {\normalfont\fontsize{12pt}{24pt}\bfseries}
  {\thesection}{1em}{}
\titleformat{\subsection}
  {\normalfont\fontsize{11pt}{11pt}\bfseries}
  {\thesubsection}{1em}{}
  
%% Figures and tables -------------------------------------------------------
%  Bare-bones setup; the user is free to add their preferred packages in the
%  preamble.
\RequirePackage{graphicx}
\RequirePackage[skip=0.5\baselineskip]{caption} 
\RequirePackage{multirow}

%% References ---------------------------------------------------------------
%  Add a number to references heading and capitalise it.
\RequirePackage[numbib]{tocbibind}
\addto{\captionsUKenglish}{\renewcommand{\refname}{REFERENCES}}