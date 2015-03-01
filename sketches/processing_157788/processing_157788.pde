
int r=0,g=0,b=0; 
boolean rstage=true; 
boolean ystage=false; 
boolean gstage=false;
boolean cystage=false; 
boolean bstage=false;
boolean pstage=false; 
boolean rrstage=false; 

boolean foward=true; 

void setup(){
  background(0);
  size(640,755);
  frameRate(5);
  println("rstageon"); 
}

void draw(){
  
  
  int c=10;
  for (int i=0;i<62;i++){
     int a=10;
    for(int j=0;j<53;j++){
      noStroke();
      fill(r,g,b); 
      ellipse(a,c,8,8);
      a+=12;
      
      if(rstage==true)
        r+=1; 
      else if(ystage==true)
        g+=1; 
      else if(gstage==true)
        r-=1;  
      else if(cystage==true)
        b+=1; 
      else if(bstage==true)
        g-=1; 
      else if(pstage==true)
        r+=1;
      else if(rrstage==true)
        b-=1;
      else 
        println("Issuse no stage set"); 
        
     
      if( foward==true){  
        if (r>=250 && rstage==true){
          r=250;
          rstage=false;
          ystage=true; 
          println("ystageon"); 
        }
        if(ystage==true && g>=250){
          ystage=false; 
           gstage=true;  
           g=250;
           println("gstageon"); 
        }
        if(gstage==true && r<=0){
          gstage=false; 
          cystage=true; 
          r=0;
          println("cystageon"); 
        }
        if( cystage==true && b>=250){
          cystage=false; 
          bstage=true; 
          b=250;
          println("bstageon"); 
        }
        if(bstage==true && g<=0){
          bstage=false; 
          pstage=true; 
          g=0;
          println("pstageon"); 
        }
        if(pstage==true && r>=250){
          pstage=false; 
          rrstage=true; 
          r=250;
          println("rrstageon"); 
        }
        if(rrstage==true && b<=0){
          rrstage=false; 
          ystage=true;
          b=0;
          println("ystageon"); 
        }
    }
    else {
       if (r>=250 && rstage==true){
          println("ooooooooooooooooooops"); 
        }
        if(ystage==true && g>=250){
          ystage=false; 
           rrstage=true;  
           g=250;
           println("rrstageon"); 
        }
        if(gstage==true && r<=0){
          gstage=false; 
          ystage=true; 
          r=0;
          println("ystageon"); 
        }
        if( cystage==true && b>=250){
          cystage=false; 
          gstage=true; 
          b=250;
          println("gstageon"); 
        }
        if(bstage==true && g<=0){
          bstage=false; 
          cystage=true; 
          g=0;
          println("cystageon"); 
        }
        if(pstage==true && r>=250){
          pstage=false; 
          bstage=true; 
          r=250;
          println("bstageon"); 
        }
        if(rrstage==true && b<=0){
          rrstage=false; 
          pstage=true;
          b=0;
          println("pstageon"); 
        }
    }
      
    }
    c+=12;
  }
  
  
}




//changes dirction of color movement if clicked
void mousePressed(){
  if (foward==true){
  foward=false; 
  }else {
    foward=true;
  }
}

