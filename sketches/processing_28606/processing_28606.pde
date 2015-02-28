
class ball {
  PVector myV, myP,direccion;
  int mySz= 15;
  int speed=30;

  
  ball(){

myP = new PVector(40,320);


PVector mouseVec = new PVector(mouseX,mouseY);
PVector dis = PVector.sub(mouseVec,myP);
dis.div(speed);
myP.add(dis);

//  myV = new PVector ( nivelFuerza*0.5,nivelFuerza*0.5);

myV = new PVector (dis.x*(nivelFuerza*0.02),dis.y*(nivelFuerza*0.02));
  }

void run(){
 update();
drawMe(); 
  }

void update (){
myV.y+= gravedad;

//  myV.x+=nivelFuerza*0.5;
//  myV.y+=nivelFuerza*0.5;

myP.x+=myV.x;
myP.y+=myV.y;

    
 if (myP.x> width-mySz/2){
  myV.x*=valorDeFriccionX;
  myP.x = width-mySz/2; 
  }

}

void drawMe(){
 noStroke();
fill(255,0,0);
ellipse (myP.x,myP.y,mySz,mySz);
  
}
boolean desaparece(){
  if ((myP.y>height-mySz/2) || (myP.x<mySz/2)){

    return true;

  }else{
return false;
}
}

boolean tocado(){
 if (((myP.x<x+rectXY) && (myP.x>x-rectXY)) &&  ((myP.y<y+rectXY) && (myP.y >y-rectXY))){
       rectXY-=6;
       
    return true;

  }else{
return false;
 }
}

}




