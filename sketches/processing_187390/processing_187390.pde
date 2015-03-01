
//snowman
size(600,600);//window size
background(115,150,70);//background color

stroke(111,62,1);//sets arm color
strokeWeight(6);//sets arms stroke thickness
line(180, 300, 220, 350);//left arm
line(280, 350, 320, 300);//right arm

stroke(0,0,0);//sets strokes of body and accesorys to black
strokeWeight(3);//sets body's stroke thickness
fill(255,255,255);//snowman body size
ellipse(250,400,100,100);//bottom body
ellipse(250,350,75,75);//middle body
ellipse(250,300,50,50);//top body

fill(0,0,0);//sets accessory color
triangle(250,305,250,295,290,300);//nose
ellipse(240,285,5,5);//left eye
ellipse(260,285,5,5);//right eye
ellipse(250,335,10,10);//top button
ellipse(250,360,10,10);//second to top button
ellipse(250,400,10,10);//second to bottom button
ellipse(250,425,10,10);//bottom button




