
// a processing remake of the web mode in mr doob's "harmony" procedural drawing app
// http://mrdoob.com/lab/javascript/harmony/#web

//ArrayList history = new ArrayList();
  int historySize = 64;
 // PVector[] poshistory = new PVector[historySize];
float distthresh = 80;
ArrayList people = new ArrayList();

void setup(){
  frameRate(30);
  size(800,600);
background(128);
  stroke(0,50);
  smooth();
  strokeWeight(0.5);
/*   for(int i=0; i<historySize ;i++){
     poshistory[i] = new PVector(0,0,0);
     //poshistory[i].y=poshistory[i+1].y;
     //poshistory[i].z=poshistory[i+1].z;
    }*/
}


void draw(){
  
  
  
  println(frameRate);
  noStroke();
  if(frameCount%5==0){
  //  fill(255,255,255,25);
    fill(0,0,0,25);
    rect(0,0,width+20,height+20);
 // background(250,250,250,250);
  }

  
  for (int p=0; p<people.size(); p++){
      person per=(person) people.get(p);
      per.update();
  }
  println(people.size());
  for (int i=0; i<people.size(); i++){    //主體
       person per=(person) people.get(i);
       PVector p = new PVector(
       per.posHistory[historySize-1].x,
       per.posHistory[historySize-1].y,
       per.posHistory[historySize-1].z);
       
       
     for (int j=0; j<people.size(); j++){  //對象
          person per2=(person) people.get(j);
       for (int k=0; k<historySize; k++){
         
         PVector v2=new PVector( per2.posHistory[k].x, per2.posHistory[k].y, per2.posHistory[k].z);
         float dis = PVector.dist(p,v2);
         float joint =   dis/distthresh;
         if(joint<random(0.3)){     stroke(per.r,per.g,per.b,per.a);  line(p.x,p.y,v2.x,v2.y);   }
         }
      }
  }
  
}

void mouseDragged(){
/*
  PVector d = new PVector(mouseX,mouseY,0);
  history.add(0,d);
      stroke(0,0,255,255);
      
  for (int p=0; p<history.size(); p++){
    PVector v = (PVector) history.get(p);
    float joinchance = p/history.size() + d.dist(v)/distthresh;
 //   if (joinchance < random(0.4))  line(d.x,d.y,v.x,v.y);
  }*/
  
  //-------------------------------------------------------------------------
   /*   stroke(0,255,0,255);
    PVector c = new PVector(mouseX,mouseY,0);
    for(int i=0; i<historySize-1 ;i++){
     poshistory[i].x = poshistory[i+1].x;
     poshistory[i].y = poshistory[i+1].y;
     poshistory[i].z = poshistory[i+1].z;
    }
     poshistory[historySize-1].x=c.x;
     poshistory[historySize-1].y=c.y;
     poshistory[historySize-1].z=c.z;
 
     for (int p=0; p<historySize; p++){
     PVector v1=new PVector( poshistory[p].x, poshistory[p].y, poshistory[p].z );
     PVector v2=new PVector( poshistory[historySize-1].x, poshistory[historySize-1].y, poshistory[historySize-1].z);
     float dis = PVector.dist(v1,v2);
     float j =  p/historySize+ dis/distthresh;
     if(j<random(0.4)){   line(c.x,c.y,v1.x,v1.y);   }
     }
  */
}
void mousePressed(){

  person one=new person(mouseX,mouseY);
  people.add(one);
  
}

void keyPressed(){
  if (key == 's') {

     background(255);
   // history.clear();
  }
}


