const title = "�ʴ���"
const yourname = "����"
const question = "2019�����һ�죬�����˭һ����ꡣ"
const info = "����˵�ѣ���Ҫ�ӱܣ�ʵ��ʵ˵��"
const scend = "��˵����������飬�Ǿ�������������װɡ�"
dim youranswer
do
youranswer = inputbox(question, title)
if youranswer <> yourname then msgbox info, vbinformation+vbokonly, title
loop until youranswer = yourname
msgbox scend, vbinformation+vbokonly, title