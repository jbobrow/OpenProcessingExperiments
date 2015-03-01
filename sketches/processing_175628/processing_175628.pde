
void setup(){
size(1000,700);
smooth();

fill(255,255,255);                            //white
rect(0,0,1000,700);                           //solid background

fill(102,51,0);                               //brown
rect(150,0,700,700);                          // brown solid background

fill(0,255,0);                                //green
ellipse(500,360,500,500);                     //actual wreath

fill(255,0,0);                                //red
quad(310,200,490,390,430,300,300,210);        //string around wreath
quad(600,290,600,300,690,200,700,210);        //string around wreath

fill(102,51,0);                               //brown
ellipse(500,360,240,240);                     //brown center of wreath

fill(255,0,0);                                //red
quad(475,200,400,500,450,510,500,200);        //left string thing
quad(525,200,600,500,550,510,500,200);        //right string thing
quad(370,160,500,200,500,230,400,220);        //left bow
quad(500,200,640,160,600,220,500,230);        //right bow
quad(480,200,520,200,520,230,480,230);        //center knot


fill(255,255,0);                              //yellow
ellipse(350,400,15,15);                       //jingle bells
ellipse(350,300,15,15);
ellipse(340,500,15,15);
ellipse(700,350,15,15);
ellipse(630,200,15,15);
ellipse(650,490,15,15);
ellipse(330,440,15,15);
ellipse(630,400,15,15);
ellipse(520,170,15,15);
ellipse(490,550,15,15);

}
