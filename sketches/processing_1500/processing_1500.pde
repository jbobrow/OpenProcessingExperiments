
// Bu çalışmam proscessing programındaki ilk özel calışmalarımdan birtanesi..
//aynı zamanda vize projem umarım ilk denememden memnun kalırsınız.
//bu yaptıgım calısma MALEVİCH adlı soyut resim yapan ressamın resmini processing programına uygulamaktı


size (600,680);
background (242,245,242);

fill(0);

//Üstteki büyük kare

filter (BLUR,2);
rect(180,30,240,240);

//sol taraftaki dikdörtken
stroke (252,174,2);
fill(252,174,2);
rect(50,300,120,160);

//sol taraftaki dikdörtkenin altındaki kucuk kare
stroke (147,90,9);
fill(147,90,9);
rect(135,460,60,60);

//sayfanın ortasındakı yuvarlak
stroke (147,90,9);
fill(147,90,9);
ellipse(240,430,80,80);

//sayfanın ortasındakı yuvarlakın ıcındeki yuvarlak
stroke(255);
fill(255);
ellipse(238,430,55,55);

//sag alt taraftaki dortgen ve renki
stroke (10,1,100);
fill(10,1,100);
quad (270,510,420,390,520,560,410,640);

//sag alt taraftaki dörtgenın altındakı dörtgen ve renki.
stroke(21,20,20);
fill (21,20,20);
quad (450,612,490,640,595,570,560,532);





//üst karedeki noktacıklar..
stroke(6);
for (int i = 0; i < 1000; i = i+1) {
  point (random(180,420),random(30,270));

}

