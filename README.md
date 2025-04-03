使用例 : 

以下、24ページのPDFファイルをAdobe Acrobatで 小冊子に印刷するときの場合を説明する。

(1) 印刷しようとすると、まずこのような画面になるであろう。

![image](https://github.com/user-attachments/assets/7cd498ef-da75-4711-b31c-fc604fb655f4)

(2) 小冊子印刷する(1枚の紙に両面に計4ページになるようにする)場合は、次の画像において「小冊子」をクリックする。
(元に戻して、1枚の紙に片面1ページにする場合には、左の「サイズ(I)」をクリックする。)
![image](https://github.com/user-attachments/assets/0768d4ef-2253-4993-a609-6056458bef74)

(3) しかし、このまま小冊子印刷をしてしまうと、小冊子専門のホッチキスを用いるしか方法がなくなってしまう(!) 
その理由は、8ページであれば、次の図のようになってしまうからである。
![image](https://github.com/user-attachments/assets/1b81c031-c1db-4960-9945-5cd3f96ae4b2)
この図はhttps://helpx.adobe.com/jp/acrobat/kb/print-booklets-acrobat-reader.html を参照した。

つまり、1,2,7,8ページ目が印刷された1枚目、3,4,5,6ページ目が印刷された2枚目に来てしまう。

(4) これを1枚目に1,2,3,4ページ目、2枚目に5,6,7,8ページ目が来る様にするには、 次のページ指定の
所で、1-2,5-8,3-4 と指定すれば良い。

![image](https://github.com/user-attachments/assets/12d19e9d-b176-45d7-b768-79c4452aeca4)

↓

![image](https://github.com/user-attachments/assets/199d655e-d56f-46b4-af0f-4a624c15b1b6)

1～24ページは6枚の紙に両面で印刷することになるが、56文字の次の文字列を、コピペして入力するとよい。

```
1-2,5-6,9-10,13-14,17-18,21-24,19-20,15-16,11-12,7-8,3-4
```

実際に入力すると、次の様になるが、24文字幅なので、次の様に一部のみが表示される。  
![image](https://github.com/user-attachments/assets/97a025f0-17fb-4edf-a39f-db734076dcaa)

上記の、56文字を生成するのが、このライブラリが提供する 12783456 という名前のコマンドである。

このコマンド 12783456 の実行例 (ページ数を引数として与える)
![image](https://github.com/user-attachments/assets/02e1932e-ad62-42d4-8328-7d1bd045f27f)

![image](https://github.com/user-attachments/assets/c1d73cc1-eb75-41f8-a66c-2dc507224788)

(5) このコマンドは、最初のページ番号と最後のページ番号の2個与えても動作する。ページ指定は
100文字という制約があるので、その制約で1回ずつ印刷できるように、1行ごとに(改行文字区切りで)複数個
出力する場合もある。下記の場合は、ページ数が4の倍数でなかったので、最後に2ページを別に印刷するように
なる。

![image](https://github.com/user-attachments/assets/261e7714-0163-4e6f-8d92-04cc830dc1b6)

(6) 捕捉となるが、コンマだけでなくてハイフンを使ったわけは、コンマだけだと、26個を超える数は
印刷のページ番号の指定の時に認識してくれないためである(数回試して判明した)。ハイフンを用いることで
コンマで区切られたパーツは17個以下に減らすことが出来る。



----
The command `12567834' yields the character strings which specifies how to 
enter the page number specification so that every printed paper contains four 
pages from the original PDF in sequential order. 

This is to avoid that, for a 8-page pdf file, the page numbering order
of the papers from a printer for the booklet printing is, usually,
1,2,7,8,3,4,5,6 not in 1,2,3,4,5,6,7.8. - By running a command sentence
`12345678 8' you get 1-2,5-8,3-4 that can easily be copy and pasted 
into the page number specification to the printing menu so that you 
get the printed paper to be folded into a booklet with a page numbering
in sequential order that is 1,2,3,4,5,6,7,8. You can specify any positive 
number instead of 8. 

When printing with Adobe Acrobat Reader, the page range input field has several limitations.
You must keep the input within 100 characters, and you cannot specify more than 26 comma-separated page numbers.
Therefore, consecutive pages should be indicated with hyphens, and the page range string should be made 
as long as possible—up to just under 100 characters—to allow for efficient printing in a single operation.
The printing will be split across multiple operations as needed.
Each of these page range strings will be displayed separated by line breaks.
This makes it possible to specify around 30 pages of the original PDF file in a single operation.

For convenience, an option `-P' is also provided to output strings that can be used with PDFtk.

To learn more about how it works, run the help option using 12567834 --help.

参照 : https://qiita.com/toramili/items/4f1583bea45f51662055
