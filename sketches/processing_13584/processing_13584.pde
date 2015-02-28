
class Betes { //utiliser dist de equat
          int fr = int(random(0,53));
          int x = floor(random(100,700));
          int y = int(random(0,height));
          //int x = width/2;
          //int y = height/2;
          float aplat;
          float h;
          float ecart;
         ///////////////////
        float angle;
       float cosine;
      float jitter;
     float sine;
    /////////////////

void roule(){
        //dist
       ecart = dist(600, y, 600, ye);
               h = pb[fr].height;
       aplat = map (ecart,0,800,0,h);
       
        y--;
      if(y <= 0){ y = 800;fr++;}//OK
      if(fr >= pb.length){fr = 0;}//OK
        h = pb[fr].height;
        //println("pb[fr].height : "+pb[fr].height +" |  aplat :"+aplat);
          ////////////////////////////
                pushMatrix();//pour éviter cascading translate
           int di = int(random(1,10));
           float d = di*.01;
           if(frameCount%50 == 0){ jitter = (random(-0.1, 0.1));}
           angle = angle + jitter;
           cosine = cos(angle);
           translate(x,y);
           rotate(cosine*d);
          ////////////////////////////
          
          
           image(pb[fr],0,0, h-aplat,h-aplat );
                          popMatrix();
          }//ferme méthode roule()
          }//ferme classe betes

