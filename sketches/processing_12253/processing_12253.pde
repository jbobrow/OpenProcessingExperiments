
 class Cont {
           
  float taille = random(height/9,height/4);
  float larg = taille/2;
  float x = random(width/3,width-width/6);
  float y = random(-taille,height+taille);
  //float y = width-y1*2;
  float h = random(360);
  float s = 360;
  float b = random(360);
  float a = random(180,320);
  float inc = random(-0.3,0.2);
  
  void contrast(){
                if(b < 20){ a = 360;}
                if(h < 20){ s = 360;}
                }
  void affiche() {
      larg += inc;
 if(larg >= taille*.62 || larg <= -taille*.62){inc *=-1;}
    fill(h,s,b,a);strokeWeight(.4);
    stroke(h,s,360,a-20);
    ellipse(x,y,larg+inc,taille);
    //stroke(h,s,b,a);
    stroke(360,20);
    line(x,0,x,y-taille/2);
  }

            }//f.classe

