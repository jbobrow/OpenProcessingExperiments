
PFont myFont = createFont("草泥马体", 32); 
PFont myFont2 = createFont("Helvetica", 32); 

String myStr = "中国你好"; 
String myStr2 = "hello China"; 

size(400, 400); 

background(0); 
fill(255); 
textFont(myFont); 
text(myStr, 30, 200);
textFont(myFont2); 
text(myStr2, 210, 200);

