
//Leroy Yang
boolean start=false;
area area[][];
int direction[][];
direct dir[];
int wid=600;
int bugnum=0;
bug bugs[];
ArrayList dots;
void setup(){
size(wid,wid);
direction=new int[3][3];
direction[0][0]=2;direction[1][0]=3;direction[2][0]=4;
direction[2][1]=5;direction[2][2]=6;direction[1][2]=7;
direction[0][2]=8;direction[0][1]=9;
dir=new direct[12];
dir[0]=new direct(0,-1,1);
dir[1]=new direct(1,-1,0);
dir[2]=new direct(2,-1,-1);
dir[3]=new direct(3,0,-1);
dir[4]=new direct(4,1,-1);
dir[5]=new direct(5,1,0);
dir[6]=new direct(6,1,1);
dir[7]=new direct(7,0,1);
dir[8]=new direct(8,-1,1);
dir[9]=new direct(9,-1,0);
dir[10]=new direct(10,-1,-1);
dir[11]=new direct(11,0,-1);
dots=new ArrayList();
colorMode(HSB,100,100,100);
smooth();
strokeWeight(8);
area=new area[wid][wid];
for(int i=0;i<wid;i++)
for(int j=0;j<wid;j++)
area[i][j]=new area(i,j);
 background(5,20,20);
stroke(5);
}

void draw(){
  
  
  fill(10,10,70);
  text("draw anything on the canvas, and then press 's'",20,20); 
   text("To clear the canvas, press 'c'",20,50); 
   if(keyPressed){
 if(key=='s'&&!start){
  start=true;
 bugs=new bug[bugnum];
  initbugs();
 
 }
  if(key=='c'){
    stroke(5);
    bugnum=0;
  dots=new ArrayList();
  start=false;
  area=new area[wid][wid];
for(int i=0;i<wid;i++)
for(int j=0;j<wid;j++)
area[i][j]=new area(i,j);
   background(5,20,20);
  }
 }
if(mousePressed&&!start){
  fill(10,50,70);
line(mouseX,mouseY,pmouseX,pmouseY);
if(area[mouseX][mouseY].state==0){
area[mouseX][mouseY].state=1;
dots.add(area[mouseX][mouseY]);
bugnum++;
}
}
if(start){
   noStroke();
 background(5,20,20);
 execute();
for(int i=0;i<bugnum;i++){
  fill(bugs[i].H,bugs[i].S,bugs[i].B);
ellipse(bugs[i].posX,bugs[i].posY,bugs[i].bsize,bugs[i].bsize);
}
}
  
}
void execute(){
for(int i=0;i<bugnum;i++){
bugs[i].decide();
}

}
void initbugs(){
int tmpx,tmpy;
  for(int i=0;i<bugnum;i++){
   while(true){
   tmpx=(int)random(0,wid);
   tmpy=(int)random(0,wid);
   if(area[tmpx][tmpy].state!=2){
     if(area[tmpx][tmpy].state==0)
   area[tmpx][tmpy].state=2;
   else
    area[tmpx][tmpy].state=3;
    
   bugs[i]=new bug(tmpx,tmpy);
   break;
   }
   }

}
}
class bug{
  boolean ontarget=false;
 int targetpx,targetpy;
int posX,posY;
int H,S,B,bsize;
public bug(int i,int j){
  H=(int)random(20,100);
  S=(int)random(50,100);
  B=(int)random(50,100);
  bsize=(int)random(5,15);
 
posX=i;
posY=j;
findtarget();
}
public void findtarget(){
area tmpa;
int count=0;
int tmp;
while(true){
count++;
tmp=(int)random(0,dots.size());
tmpa=(area)dots.get(tmp);
if(tmpa.state==1){
targetpx=tmpa.posX;
targetpy=tmpa.posY;
break;
}
if(count>50){
for(int i=0;i<dots.size();i++){
tmpa=(area)dots.get(tmp);
if(tmpa.state==1){
targetpx=tmpa.posX;
targetpy=tmpa.posY;
break;
}
}
break;
}
}
}
public void decide(){
if(!ontarget){
if(area[targetpx][targetpy].state==3){
findtarget();
}

move();

}

}
public void move(){
int dirx = (targetpx - posX == 0) ? 0 :(targetpx - posX)/abs(targetpx - posX) ;
int diry = (targetpy - posY == 0) ? 0 : (targetpy - posY)/abs(targetpy - posY);
if(area[posX][posY].state==3)
area[posX][posY].state=1;
else
area[posX][posY].state=0;
if (checkblock(posX + dirx, posY + diry)){
posX+=dirx; posY+=diry;
}
else 	{
  int id=direction[dirx+1][diry+1];
  for(int r=1;r<=2;r++){

    int tmpr;
    if(random(0,6)>3)
    tmpr=r;
    else
    tmpr=-1*r;
int tmpx= dir[id-tmpr].dirx,tmpy= dir[id-tmpr].diry;
if (checkblock(posX + tmpx, posY + tmpy)){
posX+=tmpy; posY+=tmpy;
break;
}
else{
tmpx= dir[id+tmpr].dirx;tmpy= dir[id+tmpr].diry;
if (checkblock(posX + tmpx, posY + tmpy)){
posX+=tmpy; posY+=tmpy;
break;
}
}	
}
}
if(area[posX][posY].state==0)
area[posX][posY].state=2;
else
area[posX][posY].state=3;

if(posX==targetpx && posY==targetpy)
ontarget=true;
}
public boolean checkblock(int x, int y) {

		if (x < 0 || y < 0 || x > wid - 1 || y > wid - 1)
			return false;
		else if (area[x][y].state==2||area[x][y].state==3 )
			return false;
		else

			return true;

	}
}
class direct{
int id;
int dirx,diry;
public direct(int i,int x,int y){
id=i;
dirx=x;
diry=y;
}
}
class area{
int posX,posY;
int state=0; //0:nothing 1:resource 2:bug on it 3:resource and bug on it
public area(int i,int j){
posX=i;
posY=j;
}
}

