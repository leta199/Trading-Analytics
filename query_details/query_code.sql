{\rtf1\ansi\ansicpg1252\cocoartf2822
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red0\green0\blue0;\red79\green123\blue61;
\red202\green202\blue202;\red70\green137\blue204;\red212\green212\blue212;\red100\green117\blue135;\red167\green197\blue152;
\red251\green0\blue7;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\csgray\c0\c0;\cssrgb\c37647\c54510\c30588;
\cssrgb\c83137\c83137\c83137;\cssrgb\c33725\c61176\c83922;\cssrgb\c86275\c86275\c86275;\cssrgb\c46667\c53333\c60000;\cssrgb\c70980\c80784\c65882;
\cssrgb\c100000\c0\c0;}
\margl1440\margr1440\vieww28600\viewh18000\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 /*Problem #1*/\strokec5 \
\strokec4 /* What stocks have historically had a higher than average opening, closing and high*/\strokec5 \
\
\pard\pardeftab720\partightenfactor0
\cf2 \strokec6 select\strokec5  si\strokec7 .\strokec5 symbol\strokec7 ,\strokec5  \
    \strokec6 round\strokec7 ((\strokec6 open\strokec8 /\strokec7 (\strokec6 select\strokec5  \strokec6 avg\strokec7 (\strokec6 open\strokec7 )\strokec5  \strokec6 from\strokec5  STOCK_HISTORY\strokec7 ))\strokec8 *\strokec9 100\strokec7 ,\strokec9 2\strokec7 )\strokec5  \strokec8 ||\strokec5  \strokec10 '%'\strokec5   \strokec10 "Percent of average opening price"\strokec7 ,\strokec5 \
    \strokec6 round\strokec7 ((\strokec6 close\strokec8 /\strokec7 (\strokec6 select\strokec5  \strokec6 avg\strokec7 (\strokec6 close\strokec7 )\strokec5  \strokec6 from\strokec5  STOCK_HISTORY\strokec7 ))\strokec8 *\strokec9 100\strokec7 ,\strokec9 2\strokec7 )\strokec5  \strokec8 ||\strokec5  \strokec10 '%'\strokec5   \strokec10 "Percent of average closing price"\strokec7 ,\strokec5 \
    \strokec6 round\strokec7 ((\strokec5 high\strokec8 /\strokec7 (\strokec6 select\strokec5  \strokec6 avg\strokec7 (\strokec5 high\strokec7 )\strokec5  \strokec6 from\strokec5  STOCK_HISTORY\strokec7 ))\strokec8 *\strokec9 100\strokec7 ,\strokec9 2\strokec7 )\strokec5  \strokec8 ||\strokec5  \strokec10 '%'\strokec5   \strokec10 "Percent of average high price"\strokec7 ,\strokec5 \
    \strokec6 case\strokec5   \
         \strokec6 when\strokec5    \strokec6 round\strokec7 ((\strokec6 open\strokec8 /\strokec7 (\strokec6 select\strokec5  \strokec6 avg\strokec7 (\strokec6 open\strokec7 )\strokec5  \strokec6 from\strokec5  STOCK_HISTORY\strokec7 ))\strokec8 *\strokec9 100\strokec7 ,\strokec9 2\strokec7 )\strokec5  \strokec8 >\strokec5  \strokec9 90\strokec5  \strokec6 and\strokec5  \
                \strokec6 round\strokec7 ((\strokec6 close\strokec8 /\strokec7 (\strokec6 select\strokec5  \strokec6 avg\strokec7 (\strokec6 close\strokec7 )\strokec5  \strokec6 from\strokec5  STOCK_HISTORY\strokec7 ))\strokec8 *\strokec9 100\strokec7 ,\strokec9 2\strokec7 )\strokec5  \strokec8 >\strokec5  \strokec9 90\strokec5  \strokec6 and\strokec5  \
                \strokec6 round\strokec7 ((\strokec5 high\strokec8 /\strokec7 (\strokec6 select\strokec5  \strokec6 avg\strokec7 (\strokec5 high\strokec7 )\strokec5  \strokec6 from\strokec5  STOCK_HISTORY\strokec7 ))\strokec8 *\strokec9 100\strokec7 ,\strokec9 2\strokec7 )\strokec5  \strokec8 >\strokec5  \strokec9 90\strokec5  \strokec6 then\strokec5  \strokec10 'A'\strokec5 \
         \strokec6 when\strokec5    \strokec6 round\strokec7 ((\strokec6 open\strokec8 /\strokec7 (\strokec6 select\strokec5  \strokec6 avg\strokec7 (\strokec6 open\strokec7 )\strokec5  \strokec6 from\strokec5  STOCK_HISTORY\strokec7 ))\strokec8 *\strokec9 100\strokec7 ,\strokec9 2\strokec7 )\strokec5  \strokec8 >\strokec5  \strokec9 50\strokec5  \strokec6 and\strokec5  \
                \strokec6 round\strokec7 ((\strokec6 close\strokec8 /\strokec7 (\strokec6 select\strokec5  \strokec6 avg\strokec7 (\strokec6 close\strokec7 )\strokec5  \strokec6 from\strokec5  STOCK_HISTORY\strokec7 ))\strokec8 *\strokec9 100\strokec7 ,\strokec9 2\strokec7 )\strokec5  \strokec8 >\strokec5  \strokec9 50\strokec5  \strokec6 and\strokec5  \
                \strokec6 round\strokec7 ((\strokec5 high\strokec8 /\strokec7 (\strokec6 select\strokec5  \strokec6 avg\strokec7 (\strokec5 high\strokec7 )\strokec5  \strokec6 from\strokec5  STOCK_HISTORY\strokec7 ))\strokec8 *\strokec9 100\strokec7 ,\strokec9 2\strokec7 )\strokec5  \strokec8 >\strokec5  \strokec9 50\strokec5  \strokec6 then\strokec5  \strokec10 'B'\strokec5 \
                \strokec6 else\strokec5  \strokec10 'Greater risk'\strokec5 \
    \strokec6 end\strokec5  \strokec10 "Stock grade"\strokec5 \
\strokec6 from\strokec5  stock_information si \strokec6 join\strokec5  stock_history sh \strokec6 on\strokec5  sh\strokec7 .\strokec5 symbol \strokec8 =\strokec5  si\strokec7 .\strokec5 symbol \
\
\
\
\pard\pardeftab720\partightenfactor0
\cf2 \strokec4 /*Problem #2*/\strokec5 \
\strokec4 /*Most popular shares by quantity sold*/\strokec5 \
\pard\pardeftab720\partightenfactor0
\cf2 \strokec6 with\strokec5  num_stocks \strokec6 as\strokec5 \
    \strokec7 (\strokec6 select\strokec5  \strokec6 count\strokec7 (\strokec6 unique\strokec5  symbol\strokec7 )\strokec5  total_stocks \strokec6 from\strokec5  transactions\strokec7 )\strokec5 \
\strokec6 select\strokec5  country\strokec7 ,\strokec5 \
        \strokec6 listagg\strokec7 (\strokec5  \strokec6 unique\strokec5  symbol\strokec7 ,\strokec5  \strokec10 ','\strokec7 )\strokec5  \strokec6 within\strokec5  \strokec6 group\strokec5  \strokec7 (\strokec6 order\strokec5  \strokec6 by\strokec5  symbol\strokec7 )\strokec5  \strokec10 "Stocks of companies traded in country"\strokec7 ,\strokec5 \
        \strokec6 count\strokec7 (\strokec5  \strokec6 unique\strokec5  symbol\strokec7 )\strokec5  \strokec10 "Number of companies traded"\strokec7 ,\strokec5 \
        \strokec6 round\strokec7 ((\strokec6 count\strokec7 (\strokec6 unique\strokec5  symbol\strokec7 )\strokec8 /\strokec5  ns\strokec7 .\strokec5 total_stocks\strokec7 )\strokec8 *\strokec9 100\strokec7 ,\strokec5  \strokec9 2\strokec7 )\strokec5  \strokec8 ||\strokec5  \strokec10 '%'\strokec5  \strokec10 "Percentage of total number of companies traded"\strokec7 ,\strokec5 \
        \strokec6 sum\strokec7 (\strokec5 quantity\strokec7 )\strokec5   \strokec10 "Number of stocks sold"\strokec5     \
\strokec6 from\strokec5  \strokec6 address\strokec5  \strokec6 a\strokec5  \strokec6 join\strokec5  transactions \strokec6 t\strokec5  \strokec6 on\strokec5  \strokec6 t\strokec7 .\strokec6 profile_id\strokec5  \strokec8 =\strokec5  \strokec6 a\strokec7 .\strokec6 profile_id\strokec5 \
               \strokec6 cross\strokec5  \strokec6 join\strokec5  num_stocks  ns\
\strokec6 group\strokec5  \strokec6 by\strokec5  country\strokec7 ,\strokec5  ns\strokec7 .\strokec5 total_stocks\
\strokec6 order\strokec5  \strokec6 by\strokec5  \strokec9 4\strokec5  \strokec6 desc\strokec5  \strokec7 ,\strokec9 5\strokec5  \strokec6 desc\cf5 \strokec5 \
\pard\pardeftab720\partightenfactor0
\cf5 \cb1 \
}