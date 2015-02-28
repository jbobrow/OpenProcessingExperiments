

void setup(){
  size(820,750);
  background(0);
  colorMode(HSB, 360, 100, 100,100);

}

void draw(){
 
  //CLEAR effect
  for(int X=75; X<1125; X=X+262){
    for(int Y=50; Y<749; Y=Y+175){
      if(floor(random(0, 1))==0.0){
        float A=random(0,360); 
        for(int a=X-40; a<X+200; a=a+10){
          for(int b=Y-15; b<Y+150; b=b+10){
            noStroke();
            fill(A, 20, 100, 20);
            rect(a, b, 5, 5);
            noFill();
          }
        }
      }
      
    }
  }//end of first for loop
  
//GREEN effect
  for(int X=75; X<1125; X=X+350){
    for(int Y=50; Y<749; Y=Y+233){
      if(floor(random(0, random(7,random(50,1000))))==0){
        //the special party
        fill(239,100,77,30); 
        //rect(X,Y,350,233);
        for(int x=5; x<width-10; x=x+25){
          for(int y=5; y<height-10; y=y+13){
            if(floor(random(-1, 4))==0){
              smooth();
              if(floor(random(0,2))==0){
                fill(144, random(55, 100), random(70, 90),80);
                text("0", x, y);
                noFill();
              }
              if(floor(random(0,2))==0){
                fill(144, random(55, 100), random(70, 90),80);
                text("1", x+random(32, 35), y+10);
                noFill();
              }
              /*if(floor(random(0,2))==0){
                fill(144, random(75, 100), random(70, 90),80);
                text(".", x+20, y+10);
                noFill();
              }*/
            }
          }
        }
      }
      
    }
  }//end of first for loop

  
  //RED effect
  for(int X=75; X<1125; X=X+350){
    for(int Y=50; Y<749; Y=Y+233){
      if(floor(random(0, random(200,random(350,100))))==0){
        translate(X+175,Y+117);
        for(float i=0; i<2*PI; i=i+0.01){
          rotate(0.01);
          stroke(//HSB
            360,//hue
            70,//saturation
            floor(
              random(30,
                random(65,
                  random(80,90)
                )
              )
            ),//brightness
            15//alpha channel
          );
          line(0,0,0,350);
        }
      }
      
    }
  }//end of first for loop


}//end of void draw

