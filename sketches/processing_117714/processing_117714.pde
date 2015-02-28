
// Understanding Z Matrix //



Cell[] myCells= new Cell[1000];


void setup(){

size(900,900,P3D);
for(int i=0; i<myCells.length; i++){
  
  myCells[i]=new Cell();

}

}


void draw(){
background(125,190,125);
strokeWeight(5);

translate(500,450); // Since rotation is working based on the 0 point on matrix, we should do all location changes with translate matrix.
rotateX(radians(60)); //This works with the same logic of axonometrix drawings in CAD. First think everything in plan, then give them depth.
rotateZ(radians(30)); //Rotate the matrix in order that we can see the depth we defined with Z matrix.

rect(0,0,600,600);      //I have created a base so that I can take it as reference for things moving randomly.
rectMode(CENTER);


fill(200,100,100,150);


for(int i=0;i<myCells.length;i++){
  
  myCells[i].display();
  myCells[i].update();
  myCells[i].controlzposition();   // Because I am working on Z matrix in this work, I focused on controlling Z with this function.
  
  if(i<250){
  
  line(myCells[i].location.x,myCells[i].location.y,myCells[i].location.z,300,300,0);      // The array is divided into 4 as to draw line with 4 corners of the base.
  }
  if(i>250 && i<500){;
   line(myCells[i].location.x,myCells[i].location.y,myCells[i].location.z,-300,300,0);
}

 if(i>500 && i<750){;
   line(myCells[i].location.x,myCells[i].location.y,myCells[i].location.z,300,-300,0);
}

 if(i>750 && i<999){;
   line(myCells[i].location.x,myCells[i].location.y,myCells[i].location.z,-300,-300,0);
}

}

}
  
// DNA //




class Cell{
  
  PVector location;
  PVector velocity;
 
  float a;
  float b;
  float red,green,blue;
  float pointweight;
  float aa;
  float bb;

  Cell(){
  
  location= new PVector(random(-150,150),random(-150,150),random(-150,150));
  
  a=0;
  b=0;
  red=0;
  green=0;
  blue=0;
  pointweight=1;
  aa=3;
  bb=0;

  }

  void display(){
  
  strokeWeight(pointweight);  
  stroke(red,green,blue);
  point(location.x,location.y,location.z);
    

  }

  void update(){
    
  velocity= new PVector(random(-3,3),random(-3,3),random(bb,aa));
  location.add(velocity);
    
    
  }
  
  void controlzposition(){
    
    if(location.z>350){
     aa=15;
      
    }
    
    if(location.z>2000){
      
      bb=-45;
    }
    
    if(location.z<-2000){
      
     location.z=349;
     aa=0;
     bb=0;
     location.x=0;
     location.y=0;
    }
  
 


  }

}


