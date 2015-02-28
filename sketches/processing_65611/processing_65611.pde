


String where (PVector place,int x,int y){
  //A=top left
  //B=top right
  //C=bottom left
  //D=bottom right;
  String retval = "";
  PVector q = which2(place.x,place.y);
  
    int whichisit = int(q.x);

 // if(q.z==0){
   
        if(w[whichisit].z ==1  ){
  if(x<place.x && y<place.y)retval = "A";
  if(x>place.x && y<place.y)retval = "B";
  if(x<place.x&& y>place.y)retval="C";
  if(x>place.x && y>place.y)retval="D";
  }
        if(b[whichisit].z ==1  ){
  if(x<place.x && y<place.y)retval = "A";
  if(x>place.x && y<place.y)retval = "B";
  if(x<place.x&& y>place.y)retval="C";
  if(x>place.x && y>place.y)retval="D";
  }
  
  if(w[whichisit].z==0 || b[whichisit].z==0){
    if(q.y==1){
     //white 
      if(x<place.x&& y>place.y)retval="C";
    if(x>place.x && y>place.y)retval="D";
    }
    
    if(q.y==2){
     //black 
      if(x<place.x && y<place.y)retval = "A";
      if(x>place.x && y<place.y)retval = "B"; 
    }
  }  
    
 // }

  
 
  
  //println(str(q.z));
  return retval; 
}

/////////////////////
//To do 
//Enabling force eating or allow free movement

/*

 1.4
 2.4
 3.4
 4.4
 5.4
 6.4
 7.4
 8.4
 */
 boolean iswhiteturn = true;
color tilecolour = color(0,128,64);
color one = color(255,0,0);
color two = color(0,0,255);
int wfallen=0;
int bfallen=0;
int _width;
int _height;
PImage tile;
int bs = 50;
PVector [] w= new PVector [12];
PVector [] b = new PVector [12];
int wc=0;
int bc=0;
int rc;
boolean dooffset = false;
void setup(){
  tile = createImage(bs*2,bs*2,ARGB);

  for (int x=bs;x<bs*2;x++){
    for (int y=0;y<bs;y++){
      tile.set(x,y,tilecolour);
    } 
  }

  for (int x=0;x<bs;x++){
    for (int y = bs;y<bs*2;y++){
      tile.set(x,y,tilecolour);
    } 
  }
  _width = bs*8;
  _height = bs*8;
  //size(_width+255+(bs*2) ,_height,JAVA2D);
  size(755,400,JAVA2D);

  // background(255);
  for (int x=0;x<_width;x++){
    for (int y =0;y<_height;y++){
      if(x%2==0 || y%2==0)set(x,y,color((int)random(0,1)));
    } 
  }
  smooth();
  for (int x =0;x<_width;x+=bs*2){
    for (int y=0;y<_height;y+=bs*2){
      image(tile,x,y);
    } 
  }
  back=get();

  ellipseMode(CENTER);
  rc=0;
  strokeWeight(2);
  for (int y=0;y<_height;y+=bs){
    for (int x=0;x<_width;x+=bs*2){
      if(rc<3 ||rc>4){
        if(!dooffset){
          if( rc<3  ){
            fill(one);
            w[wc]=new PVector(x+offset+offset+offset,y+offset,0);
            wc++;
          }
          if( rc>4  ){
            fill(two);
            b[bc]=new  PVector(x+offset+offset+offset,y+offset,0);
            bc++;
          }
          ellipse(x+offset+offset+offset,y+offset,bs-10,bs-10);

        }
        if(dooffset)
        {
          if( rc<3  ){
            w[wc]=new PVector(x+offset,y+offset,0);
            fill(one);
            wc++; 
          }
          if( rc>4  ){
            b[bc]=new PVector(x+offset,y+offset,0);
            fill(two);
            bc++; 
          }
          ellipse(x+offset,y+offset,bs-10,bs-10);

        }
      }

    }
    rc++;
    dooffset=!dooffset;
  }  

}
int offset = bs/2;
PImage back;

void setupmen(){
  rc=0;
  wc=0;
  bc=0;

  wfallen=0;
  bfallen=0;
  //  strokeWeight(2);
  for (int y=0;y<_height;y+=bs){
    for (int x=0;x<_width;x+=bs*2){
      if(rc<3 ||rc>4){
        if(!dooffset){
          if( rc<3  ){
            fill(one);
            w[wc]=new PVector(x+offset+offset+offset,y+offset,0);
            //         if(wc<12){
            //         w[wc].x=x+offset+offset+offset;
            //         w[wc].y=y+offset;
            //         }
            wc++;
          }
          if( rc>4  ){
            fill(two);
            b[bc]=new  PVector(x+offset+offset+offset,y+offset,0);
            bc++;
          }
          //          ellipse(x+offset+offset+offset,y+offset,bs-10,bs-10);
          //
        } //offset=true
        if(dooffset)
        {
          if( rc<3  ){
            w[wc]=new PVector(x+offset,y+offset,0);
            fill(one);
            wc++; 
          }
          if( rc>4  ){
            b[bc]=new PVector(x+offset,y+offset,0);
            fill(two);
            bc++; 
          }
          ellipse(x+offset,y+offset,bs-10,bs-10);

        }
      }
      //
    }
    rc++;
    dooffset=!dooffset;
  }  
}
void drawbuttons(){
  for (int i =0;i<12;i++){
    fill(one);

    stroke(1);
    strokeWeight(3);

    float dis = dist(mouseX,mouseY,w[i].x,w[i].y);
    if(dis<bs/2)strokeWeight(6);
    ellipsex(w[i].x,w[i].y,bs-10,bs-10); 


    stroke(1,128);

    if(dis<bs/2){
      // strokeWeight(8);
      placebutton(w[i],mouseX,mouseY);

      //put direction bubbble
    }

    strokeWeight(3);
    fill(two);
    stroke(1,128);
    dis = dist(mouseX,mouseY,b[i].x,b[i].y);
    if(dis<bs/2)strokeWeight(6);
    ellipsex(b[i].x,b[i].y,bs-10,bs-10);



    if(dis<bs/2){

      placebutton(b[i],mouseX,mouseY);
      stroke(1);

      //put direction bubbble 
    }

  }
}


void draw(){
  image(back,0,0);
  drawbuttons();

  //background(back);  

}
void mousePressed(){
  PVector q= which2(mouseX,mouseY); 
}

void placebutton(PVector place,int x,int y){
  int herex= int(place.x);
  int herey = int(place.y);
  float dis = dist(place.x,place.y,x,y);
  strokeWeight(1);
  String wh = where (place,x,y); 
  int px = 0;
  int py =0;
  int px2=0;
  int py2= 0;
  fill(255,0,255);
  noFill();
  if(wh=="A"){
    px = int(place.x-bs);
    py =int(place.y-bs);
    px2= int(place.x-(bs*2));
    py2 = int(place.y-(bs*2));
    if(get(px,py)==tilecolour ) {
      ellipse(px,py,10,10);
      // ellipse(place.x-bs/2,place.y-bs/2,8,8);

    }
    //  else{
    if(get(px,py)!=get(herex,herey) && get(px2,py2)==tilecolour)
    {

      ellipse(px2,py2,10,10);
    }
    // }
  }
  if(wh=="B"){
    px = int(place.x+bs);
    py =int(place.y-bs);
    px2= int(place.x+(bs*2));
    py2 = int(place.y-(bs*2));
    if(get(px,py)==tilecolour  ) {
      ellipse(px,py,10,10);
      // ellipse(place.x+bs/2,place.y-bs/2,8,8);

    }

    if(get(px,py)!=get(herex,herey) && get(px2,py2)==tilecolour ){
      ellipse(px2,py2,10,10);
    }

  }
  if(wh=="C"){
    px = int(place.x-bs);
    py =int(place.y+bs);
    px2= int(place.x-(bs*2));
    py2 = int(place.y+(bs*2));
    if(get(px,py)==tilecolour ){
      ellipse(px,py,10,10);
      // ellipse(place.x-bs/2,place.y+bs/2,8,8);
    }

    if(get(px,py)!=get(herex,herey) && get(px2,py2)==tilecolour ){
      ellipse(px2,py2,10,10);
    }
  }
  if(wh=="D"){
    px = int(place.x+bs);
    py =int(place.y+bs);
    px2= int(place.x+(bs*2));
    py2 = int(place.y+(bs*2));
    // fill(1);
    //ellipse(px,py,4,4);

    if(get(px,py)==tilecolour ) {
      ellipse(px,py,10,10);
      //   ellipse(place.x+bs/2,place.y+bs/2,8,8);

    }
    // else
    //   {
    if(get(px,py)!=get(herex,herey) && get(px2,py2)==tilecolour ){
      ellipse(px2,py2,10,10);
    }
    //}
  }
}

PVector which(float x,float y){
  int jeff=-1;
  float [] wd = new float [12];
  float [] bd= new float [12];
  PVector mid = new PVector(x,y,0);
  for (int i = 0;i<12;i++){
    float disw = dist(mid.x,mid.y,w[i].x,w[i].y);
    wd[i]=disw;
    float disb = dist(mid.x,mid.y,b[i].x,b[i].y);
    bd[i]=disb;
    //if(b[i]==mid)b[i]=new PVector(-15,-15,0);
    //if(w[i]==mid)w[i]=new PVector(-15,-15,0); 
  }
  float retvalw = wd[0];
  float retvalb=bd[0];
  int hitw=0;
  int hitb=0;
  for (int i = 0;i<12;i++){
    if(wd[i]<retvalw){
      retvalw=wd[i];
      hitw=i;
      // wfallen++;
    }
    if(bd[i]<retvalb){
      retvalb=bd[i];
      hitb=i;
      // bfallen++;
    }
  }
  int hitem=0;
  if(retvalw<retvalb){
    jeff=1;
    hitem=hitw;
    //this.frame.setTitle("white "+str(hitw));
    // println(jeff);
  }
  if(retvalb<retvalw){
    //this.frame.setTitle("black "+str(hitb));  
    jeff=2; 

    hitem=hitb;
    // println(jeff);
  }

  PVector retval = new PVector(hitem,jeff,0);

  return retval;

}



void ellipsex(float x,float y,int wd,int ht){
  boolean makeline = false;
  PVector dothat = which(x,y);
  int index = int(dothat.x);
  if (dothat.y==1){ // white

    if(w[index].z==1)makeline = true;
  }
  if(dothat.y==2){//black
    if(b[index].z==1)makeline = true;

  }

  ellipse(x,y,wd,ht);
  if(makeline){
    strokeWeight(2);
    ellipse(x,y,36,36);
    ellipse(x,y,30,30);
    line(x-5,y+5,x+5,y+5);
    line(x-5,y+5,x-5,y-2);
    line(x+5,y+5,x+5,y-2);

    ellipse(x-5,y-5,4,4);
    ellipse(x+5,y-5,4,4);
    ellipse(x,y-10,4,4);
    //  line(x-5,y-10,x-5,y+10);
    //  line(x-5,y-10,x,y-10);
    //  line(x-5,y+10,x,y+10);
    //  line(x,y-10,x,y-4);
    //  line(x,y+10,x,y+4);
    //  line(x,y+4,x+5,y+10);
    //  line(x,y-4,x+5,y-10);
    //  line(x+5,y-10,x+10,y-10);
    //  line(x+5,y+10,x+10,y+10);
    //  line(x+10,y+10,x+1,y);
    //  line(x+10,y-10,x+1,y);
  }
}
color release = 0;
void mouseReleased(){
  release = get(mouseX,mouseY);
  int it = 0;

  if(release==one){
    float [] dq= new float [12];
    float disx = dist(w[0].x,w[0].y,mouseX,mouseY);

    for (int i =0;i<12;i++){
      float dis = dist(w[i].x,w[i].y,mouseX,mouseY);
      dq[i]=dis;
      //   if(disx<dis)it=i;

    }

    float retval  = dq[0];
    for (int i = 0;i<12;i++){
      if(dq[i]<retval){
        retval = dq[i];
        it =i; 

      }
    }


    //  println(it);
    //String where = wh(w[it].x,w[it].y,mouseX,mouseY);
    move(w[it],mouseX,mouseY);

  } //ONE
  if(release==two){
    float [] dq= new float [12];
    float disx = dist(b[0].x,b[0].y,mouseX,mouseY);

    for (int i =0;i<12;i++){
      float dis = dist(b[i].x,b[i].y,mouseX,mouseY);
      dq[i]=dis;
      //   if(disx<dis)it=i;

    }

    float retval  = dq[0];
    for (int i = 0;i<12;i++){
      if(dq[i]<retval){
        retval = dq[i];
        it =i; 

      }
    }


    //  println(it);
    //String where = wh(w[it].x,w[it].y,mouseX,mouseY);
    //print("black");
    move(b[it],mouseX,mouseY);
  } //TWO
}



void move(PVector place,int x,int y){
  boolean canmove = true;
  int herex = int(place.x);
  int herey = int(place.y);
  boolean iswhite =false;
  boolean isblack = false;
  if(get(herex,herey)==one)iswhite = true;
  if(get(herex,herey)==two)isblack=true;
  int whichisit = 0;

  int px=0;
  int py=0;
  String wh = where (place,x,y); 
  if(wh=="A" ){
    //normal
    px=int(place.x-(bs));
    py=int(place.y-(bs));
    int px2=int(place.x-(bs*2));
    int py2=int(place.y-(bs*2));

    if(get(px,py)==tilecolour){
      place.x=place.x-(bs);
      place.y=place.y-(bs); 
    }

    //jump
    // if( get(px,py)!=get(herex,herey && get() {
    else

        if( get(px,py)!=get(herex,herey) && get(px2,py2)==tilecolour && get(px,py) !=tilecolour){
        //  print("jump");


        //if jump then remove the marker that is in the way
        color hitem = get(px,py);
        if(hitem==one){
          for (int i=0;i<12;i++){
            // if (w[i].x>
          }
        }
        if(hitem==two){
          for (int i=0;i<12;i++){

          }
        }

        place.x=place.x-(bs*2);
        place.y=place.y-(bs*2); 
        jump(herex,herey,place.x,place.y);
      }


    //   print("A");
  }
  if(wh=="B" ){
    //normal
    px=int(place.x+(bs));
    py=int(place.y-(bs));
    if(get(px,py)==tilecolour){
      place.x=place.x+(bs);
      place.y=place.y-(bs); 
    }
    //jump
    int px2=int(place.x+(bs*2));
    int py2=int(place.y-(bs*2));
    if( get(px,py)!=get(herex,herey) && get(px2,py2)==tilecolour && get(px,py) !=tilecolour){
      //    print("jump");
      place.x=place.x+(bs*2);
      place.y=place.y-(bs*2); 
      jump(herex,herey,place.x,place.y);
    } 
    //  print("B");
  }
  if(wh=="C" ){
    //normal
    px=int(place.x-(bs));
    py=int(place.y+(bs));
    if(get(px,py)==tilecolour){
      place.x=place.x-(bs);
      place.y=place.y+(bs); 
    }
    //jump
    int px2=int(place.x-(bs*2));
    int py2=int(place.y+bs*2);
    if( get(px,py)!=get(herex,herey) && get(px2,py2)==tilecolour && get(px,py) !=tilecolour){
      //    print("jump");
      place.x=place.x-(bs*2);
      place.y=place.y+(bs*2); 
      jump(herex,herey,place.x,place.y);
    }
    //  print("C");
  }
  if(wh=="D"){
    //normal
    px = int(place.x+(bs));
    py = int(place.y+(bs));
    if(get(px,py)==tilecolour){
      place.x=place.x+(bs);
      place.y=place.y+(bs); 
    }

    //jump
    int px2 = int(place.x+(bs*2));
    int py2 = int(place.y+(bs*2));
    if( get(px,py)!=get(herex,herey) && get(px2,py2)==tilecolour && get(px,py) !=tilecolour){
      //   print("jump");
      place.x=place.x+(bs*2);
      place.y=place.y+(bs*2); 
      jump(herex,herey,place.x,place.y);
    }
    // print("D");
  }
  for (int i=0;i<12;i++){
    if(w[i].y>_height-(bs) && w[i].x<_width)w[i].z=1;
    if(b[i].y<bs && b[i].x<_width)b[i].z=1; 
  }

}


void keyPressed(){
  if(key=='r')setupmen(); 
}



void jump(float sx,float sy,float ex,float ey){
  float [] wd = new float [12];
  float [] bd= new float [12];
  PVector mid = new PVector((sx+ex)/2,(sy+ey)/2,0);
  for (int i = 0;i<12;i++){
    float disw = dist(mid.x,mid.y,w[i].x,w[i].y);
    wd[i]=disw;
    float disb = dist(mid.x,mid.y,b[i].x,b[i].y);
    bd[i]=disb;
    //if(b[i]==mid)b[i]=new PVector(-15,-15,0);
    //if(w[i]==mid)w[i]=new PVector(-15,-15,0); 
  }
  float retvalw = wd[0];
  float retvalb=bd[0];
  int hitw=0;
  int hitb=0;
  for (int i = 0;i<12;i++){
    if(wd[i]<retvalw){
      retvalw=wd[i];
      hitw=i;
      // wfallen++;
    }
    if(bd[i]<retvalb){
      retvalb=bd[i];
      hitb=i;
      // bfallen++;
    }
  }
  int span = bs+bs/2;
  if(retvalw<retvalb){
    wfallen++;
    if(wfallen>6)wspan=1;
    if(wfallen<=6) w[hitw]=new PVector(span+_width+bs/2+(bs*wspan),(wfallen*bs)-bs/2,0);
    if(wfallen>6)w[hitw]=new PVector((span)+_width+bs/2+(bs*wspan),((wfallen-6)*bs)-bs/2,0);

  }
  if(retvalb<retvalw){
    bfallen++;
    if(bfallen>6)bspan=1;
    if(bfallen<=6)  b[hitb]=new PVector((span)+_width+bs+bs+(bs*bspan)+bs/2,(bfallen*bs)-bs/2,0);
    if(bfallen>6) b[hitb]=new PVector((span)+_width+bs+bs+(bs*bspan)+bs/2,((bfallen-6)*bs)-bs/2,0);

  }


}
int wspan=0;
int bspan=0;


float distx(float a,float b,float c,float d){

  if (a>_width)a=_width;
  if (b>_height)b=_height;
  float retval = dist(a,b,c,d);
  return retval;
}


PVector which2(float x,float y){
  int jeff=-1;
  float [] wd = new float [12];
  float [] bd= new float [12];
  PVector mid = new PVector(x,y,0);
  for (int i = 0;i<12;i++){
    float disw = dist(mid.x,mid.y,w[i].x,w[i].y);
    wd[i]=disw;
    float disb = dist(mid.x,mid.y,b[i].x,b[i].y);
    bd[i]=disb;
    //if(b[i]==mid)b[i]=new PVector(-15,-15,0);
    //if(w[i]==mid)w[i]=new PVector(-15,-15,0); 
  }
  float retvalw = wd[0];
  float retvalb=bd[0];
  int hitw=0;
  int hitb=0;
  for (int i = 0;i<12;i++){
    if(wd[i]<retvalw){
      retvalw=wd[i];
      hitw=i;
      // wfallen++;
    }
    if(bd[i]<retvalb){
      retvalb=bd[i];
      hitb=i;
      // bfallen++;
    }
  }
  int hitem=0;
  if(retvalw<retvalb){
    jeff=1;
    hitem=hitw;
   // this.frame.setTitle("white "+str(hitw));
    if(w[hitw].y>_height-(bs))w[hitw].z=1;
    // println(jeff);
  }
  if(retvalb<retvalw){
  //  this.frame.setTitle("black "+str(hitb));  
    if(b[hitb].y<(bs))b[hitb].z=1;
    jeff=2; 

    hitem=hitb;
    // println(jeff);
  }

  PVector retval = new PVector(hitem,jeff,0);

  return retval;

}



