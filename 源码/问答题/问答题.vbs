const title = "问答题"
const yourname = "风屿"
const question = "2019的最后一天，你想跟谁一起跨年。"
const info = "你在说谎！不要逃避，实话实说。"
const scend = "你说出了你的心扉，那就向他（她）表白吧。"
dim youranswer
do
youranswer = inputbox(question, title)
if youranswer <> yourname then msgbox info, vbinformation+vbokonly, title
loop until youranswer = yourname
msgbox scend, vbinformation+vbokonly, title