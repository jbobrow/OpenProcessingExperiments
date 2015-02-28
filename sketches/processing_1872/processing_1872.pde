
/* Drag & Drop
 * por Dennys Regalado Díaz
 * Rompecabezas (02 dic 2008)
 */
PImage images[][],fondo,grid,banner;
cuadro piezas[];
String path_images ="";
int pos_x,pos_y,dragged_item,grid_x,grid_y;
boolean config_inicial;
float offset;
void setup(){
  images = new PImage[4][4];
  piezas = new cuadro[16];
  for(int i=0; i<4; i++)
    for(int j=0; j<4; j++)
      images[i][j]= loadImage(path_images+"image"+i+j+".jpg");

  fondo = loadImage(path_images+"fondo.jpg");
  grid = loadImage(path_images +"grid.png");
  banner = loadImage(path_images +"banner.png");
  size(420,350);      
  pos_x = 10; 
  pos_y = 230;
  config_inicial = true;
  dragged_item = -1;
  grid_x = 10;   grid_y =15;

}
class cuadro{
  int x1,x2,y1,y2;
  int ini_x1,ini_x2,ini_y1,ini_y2;
  cuadro(int x1,int y1,int x2,int y2){
    this.x1 = ini_x1=x1;
    this.y1 = ini_y1=y1;
    this.x2 = ini_x2=x2;
    this.y2 = ini_y2=y2;
  }
  boolean over(int x,int y){
    return (x>=x1 && x<=x2 && y>=y1 && y<=y2);
  }
  void back_to_panel(){
    x1 = ini_x1;
    y1 = ini_y1;
    x2 = ini_x2;
    y2 = ini_y2;
  }
}
void draw(){
  background(fondo);
  //banner
/*  float offsetTarget = map(mouseY, 0, height, -banner.height/2.5, 0);
  offset += (offsetTarget-offset)*0.05; 
  tint(188,211,95, 201);
  image(banner, 350, offset);    
  noTint();*/
  //
  int x=pos_x,y=pos_y;
  //load images on panel
  if(config_inicial){
    config_inicial = false;
    for(int i=0;i<16;i++){
      piezas[i] = new cuadro(x,y,x+48,y+48);
      if((i+1)%8==0){
        x = pos_x;
        y +=50;
      }
      else
        x +=50;   
    }
  }

  image(grid,grid_x,grid_y);
  ///
  for(int i=0; i<16; i++)
    image(images[i/4][i%4],piezas[i].x1,piezas[i].y1);
  //    image(images[i%4][i/4],grid_x+6+48*(i/4),grid_y+5+48*(i%4));    
  
}

void mouseDragged(){
  
  for(int i=0; i<16; i++){
    if(dragged_item==i || (dragged_item==-1 && piezas[i].over(mouseX,mouseY) )){

      dragged_item = i;
      piezas[i].x1 = mouseX-24;
      piezas[i].y1 = mouseY-24;
      piezas[i].x2 = mouseX+24;
      piezas[i].y2 = mouseY+24;
      break;
    }
  }
}

void mouseReleased(){
  int minx,miny,maxx,maxy;
  if(dragged_item!=-1){
    minx = grid_x+6+48*(dragged_item%4);
    maxx = minx+48;
    miny = grid_y+5+48*(dragged_item/4);
    maxy = miny+48;
//    println(minx+","+maxx+","+miny+","+maxy);
//    println(mouseX+","+mouseY);
    if(mouseX>=minx && mouseX<=maxx &&
      mouseY>=miny && mouseY<=maxy){
      piezas[dragged_item].x1 = minx;
      piezas[dragged_item].x2 = maxx;
      piezas[dragged_item].y1 = miny;
      piezas[dragged_item].y2 = maxy;
    }
    else{
      piezas[dragged_item].back_to_panel();
    }
    dragged_item = -1;
  }
}






