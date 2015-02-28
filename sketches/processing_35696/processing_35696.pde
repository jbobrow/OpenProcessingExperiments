
background (144,142,149);
size(500,500);

smooth();

arc (200,220,30,25,PI,2*PI);//eyelid 
arc(300,220,30,25,PI,2*PI); //eyelid 
ellipse (200,220,20,20); //left eye
ellipse (300,220,20,20); //right eye
fill (62,61,64); //eyeball fill
ellipse (298,222,5,7); //eyeball
ellipse (198,222,5,7); //eyeball
fill (240,188,157,175); //head fill
stroke (240,188,157,175); //head stroke color
ellipse(250,250,230,280); //head
stroke (64,60,60,50); //mouth stroke color
fill(196,154,156); //mouth color
arc (250,300,100,100,0,PI); //mouth
fill (193,159,123,175); //nose color
arc (250,260,25,25,0,PI); //nose

fill(62,61,64); //hat fill
//triangle(230,200,270,200,250,50);
triangle(200,150,300,150,250,10); //hat top
arc (250,175,250,125,PI,2*PI); //hat bottom
strokeWeight(3);
line (220,208,175,200); //left eyebrow
line (280,208,325,200); //right eyebrow
//arc (250,330,50,50,PI,2*PI);

strokeWeight(3); //hair

line(150,160,100,400);//l hair
line(160,160,115,380); //l hair
line (158,160,125,375); //l hair
line(155,160,100,360); //l hair
line(157,160,113,360); //l hair
line(155,160,90,340); //l hair

line(350,160,369,380); //hair
line(340,160,375,370); //hair
line(343,160,389,340); //r hair
line(338,160,390,358); //r hair
line(353,160,390,330); //r hair
line(350,160,400,320); //r hair

fill (239,240,232);
strokeWeight (0);
quad(250,300,250,310,260,310,260,300); //tooth
quad(265,300,265,310,275,310,275,300); //tooth
quad(220,300,220,310,230,307,230,300); //tooth

                
                
