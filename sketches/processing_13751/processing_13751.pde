
int Pa, Ma, Pb, Mb;
 
void setup(){
    size(400,400);
    background(0);
    frameRate(256);
}

void draw(){

    
     for (int i = 0;i<=180;i=i+1) {
     
      Pa = 200+random(i);
      Ma = 200-random(i);
      Pb = 400-random(1+15%Pa*i);
      Mb = 400-random(1+15%Ma*tan(i));
     
     stroke(255);
     strokeWeight(0.2);
     
     line(Ma,Pb,Ma+1,Pb+1);
     line(Pa,Mb,Pa+1,Mb+1);
     
     ellipse(220,100,1,1);
     ellipse(245,100,1,1);
     }
    }
                        
