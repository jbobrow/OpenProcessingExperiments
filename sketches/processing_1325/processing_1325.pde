
class Flower
{
  int total = 8;
  Petal[] petals;
  
  Flower(){
    petals = new Petal[total]; 
     int i;
     for(i=0; i<total; i++){
        petals[i] = new Petal();
     }
  }
  
  public void draw() { 
     Petal p;
     float w=width/2, h=height/2;
      translate(w, h);
     int i;
     for(i=0; i<total; i++){
        p = petals[i];
        rotate( ((360/total)*i)*PI/180 );
        p.draw();
     }
  }
}

