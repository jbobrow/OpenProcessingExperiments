
int count = 10;  
int ballSize = 80;  
float[][] ball = new float[count][5];  
int sel = 0;  

void setup(){  



frameRate(10);  

size(700,400);  
for(int j=0;j< count;j++){  

    ball[j][0]=random(width);    

    ball[j][1]=random(height);   

    ball[j][2]=(ballSize);           

    ball[j][3]=random(-1,1);   

    ball[j][4]=random(-1,1);       

  }  

}  

   

void draw(){  

  background(0);  

  for (int j=0;j< count;j++){  

  noStroke();  

  float radi=ball[j][2];  


     

  ellipse(ball[j][0],ball[j][1],radi,radi);  

     

  ball[j][0]+=ball[j][3];  

  ball[j][1]+=ball[j][4];  

  }  
  
}
     void mousePressed() {
 


 
  fill (random(0,200), random(0,200),random(0,200),random(0,200));
 
  }

//Imogen Temm 


