
int a = 20;
int b = 500;

  size(500,500);
  smooth();
  colorMode(RGB,500);
  
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      stroke(i,0,j);
      point(i,j);
      
    }
  }


fill(34,173,23,150);
quad(100,300,110,315,155,300,140,270);
quad(100,300,110,315,105,330,80,290);
quad(80,290,65,290,70,305,92,307);
quad(65,290,70,305,60,310,60,297);
triangle(60,297,60,310,50,320);
quad(105,330,97,320,90,325,90,335);
triangle(90,325,90,335,80,330);
arc(250,240,225,225,0,radians(360));
quad(400,300,390,315,345,300,360,270);
quad(400,300,390,315,395,330,420,290);
quad(420,290,435,290,430,305,408,307);
quad(435,290,430,305,440,310,440,297);
triangle(440,297,440,310,450,320);
quad(395,330,403,320,410,325,410,335);
triangle(410,325,410,335,420,330);
arc(250,352.5,125,125,radians(220),radians(320));
arc(250,272.5,125,125,radians(400),radians(500));
ellipse(250,220,50,50);
ellipse(250,220,100,100);
triangle(240,127.5,260,127.5,250,100);
ellipse(250,100,20,20);
ellipse(250,380,200,50);
ellipse(250,400,250,50);
ellipse(250,420,300,50);


ellipse(100,100,45,45);
ellipse(100,90,15,15);
triangle(80,110,90,120,80,130);
triangle(120,110,110,120,120,130);

ellipse(400,100,45,45);
ellipse(400,90,15,15);
triangle(420,110,410,120,420,130);
triangle(380,110,390,120,380,130);

ellipse(450,200,45,45);
ellipse(450,190,15,15);
triangle(470,210,460,220,470,230);
triangle(430,210,440,220,430,230);
                
                
