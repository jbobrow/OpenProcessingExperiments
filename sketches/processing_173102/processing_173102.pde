
class CampoVettoriale{
    public int[][] xForce;
    public int[][] yForce;
    public Barra[] barre;
    int width,height;
        
    public void azzeraCelle(){
        for(int i=0;i<height;i++)
            for(int j=0;j<width;j++){
                    xForce[i][j]=0;
                    yForce[i][j]=0;
                }
    
    }
    
    public CampoVettoriale(int width,int height,Barra[] bars){
        this.width=width;
        this.height=height;
        xForce=new int[height][];
        yForce=new int[height][];
        for(int i=0;i<height;i++){
            xForce[i]=new int[width];
            yForce[i]=new int[width];
        }
        azzeraCelle();
                
        barre=bars;
    }

    public void aggiornaCampi(){
        azzeraCelle();
        for(int i=0;i<barre.length;i++){
            if(barre[i]==null)
                break;
            for(int k=barre[i].yc-barre[i].raggioAzione;k<=barre[i].yc+barre[i].raggioAzione;k++){
                if(k<0) continue;
                if(k>=height) break;
                for(int f=barre[i].xc-barre[i].raggioAzione;f<=barre[i].xc+barre[i].raggioAzione;f++){
                    if(f<0) continue;
                    if(f>=width) break;

                    
                    yForce[k][f]+=(k-barre[i].yc);
                    xForce[k][f]+=(f-barre[i].xc);
                    
                    
                }
                
            }
            
        }
        
         
    }
    
}


CampoVettoriale campoVett;



boolean onObject=false;

interface Movibile{
     public abstract boolean isInside(int xMouse,int yMouse);
     public abstract void muovi(PVector mov);
}



class Sfera implements Movibile{
    public boolean shape=false;
    public int x,y;
    public int radius=2;
    public int maxradius;
    public float r,g,b;
    
    public Sfera(int x,int y,int r,int g,int b,int maxraggio){this.x=x; this.y=y; maxradius=maxraggio; this.r=r; this.g=g; this.b=b;}
    
    public void aggiornaRaggio(){
        radius = (shape) ? (radius-3) : radius+3;
        if(radius<=1)
            shape=false;
        else if(radius>=maxradius)
            shape=true;
    
    }
    
    public void disegnami(){
        noStroke();
        fill(r,g,b,100);
        ellipse(x,y,radius,radius);
    }
    
    public void aggiornaXY(int nx,int ny){
        x=nx;
        y=ny;
    }
    
    public boolean isInside(int xMouse,int yMouse){
        if(xMouse>=x-(int)(maxradius) && xMouse<=x+(int)(maxradius) && yMouse>=y-(int)(maxradius) && yMouse<=y+(int)(maxradius))
            return true;
        else return false;
    }
     
    public void muovi(PVector mov){
        x+=mov.x;
        y+=mov.y;
    }
    
    public void resetRaggio(){
        radius=maxradius;
    }
    
}

Sfera[] sfere;



class Barra implements Movibile{
    public int maxwidth,maxheight,width,height,xc,yc;
    public float r,g,b;
    public int raggioAzione;
    
    
    private boolean shape;
    
    public Barra(int maxw,int maxh,int x,int y,float r,float g,float b){
        maxwidth=maxw; maxheight=maxh; 
        xc=x; yc=y;
        width=maxw; height=maxh;
        this.r=r; this.g=g; this.b=b;
        raggioAzione=100;
        
        
    }
    
    public void aggiornaDimensioni(){
        width= (!shape) ? width+2 : width-2;
        height= (!shape) ? height+2 : height-2;
        if(width<=40 || height<=40)
            shape=false;
        else if(width>=maxwidth || height>=maxheight)
            shape=true;
        
    }
    
    public void resetDimensioni(){
        width=maxwidth;
        height=maxheight;
    }
    
    public void disegnami(){
        noStroke();
        fill(r,g,b,40);
        rect(xc-(int)(width/2),yc-(int)(height/2),width,height);
    }
    
    public boolean isInside(int xMouse,int yMouse){
        if(xMouse>=xc-(int)(maxwidth/2) && xMouse<=xc+(int)(maxwidth/2) && yMouse>=yc-(int)(maxheight/2) && yMouse<=yc+(int)(maxheight/2))
            return true;
        else return false;
    }
     
    public void muovi(PVector mov){
        xc+=mov.x;
        yc+=mov.y;
    }

}

Barra[] barre;

int indlastbarra=-1;



//828
//////////////////////////////////////////

class Spawned extends Barra{
    
    public Spawned(int w,int h,int x,int y,float r,float g,float b){
        super(w,h,x,y,r,g,b);
    }
    
    public void sommaPVector(PVector vect){
    
        xc+=vect.x; yc+=vect.y;
    }
    
}


class Lanciatore extends Barra{
    public int maxspawn;
    private Spawned[] spawnati;
    private int indlastspawn=-1;
    public boolean isOn;
    
    public Lanciatore(int w,int h,int x,int y,float r,float g,float b,int maxspawn){
        super(w,h,x,y,r,g,b);
        this.maxspawn=maxspawn;
        spawnati=new Spawned[maxspawn];
        isOn=false;
        
    }
    
    public void lancia(){
        indlastspawn++;
        if(indlastspawn>=maxspawn)
            indlastspawn=0;
        spawnati[indlastspawn]=new Spawned(5,5,this.xc,yc,r,g,b);
    }
    
    public Spawned[] getSpawnati(){return spawnati;}
    
}

Lanciatore[] lanciatori;

int indlastlanciatore=-1;


void addBarra(){
    barre[++indlastbarra]=new Barra(75,75,(int)(Math.random()*width),(int)(Math.random()*height),(int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));   

}

void addLanciatore(){
    int xPos=(int)(Math.random()*(width-100));
    int yPos=(int)(Math.random()*(height-100));
    int r=(int)(Math.random()*256);
    int g=(int)(Math.random()*256);
    int b=(int)(Math.random()*256);
    
    lanciatori[indlastlanciatore+1]=new Lanciatore(75,75,xPos,yPos,r,g,b,100);
    sfere[++indlastlanciatore]=new Sfera(xPos+50,yPos,r,g,b,40);
}


void setup(){
        size(1000,500);
        
        barre=new Barra[5];
        /*barre[0]=new Barra(75,75,800,height-75,255,0,250);*/
        
        campoVett=new CampoVettoriale(1000,500,barre);
        campoVett.aggiornaCampi();
        
        sfere=new Sfera[10];
        lanciatori=new Lanciatore[10];
        
        
                for(int i=0;i<4;i++){
                    addBarra();
                addLanciatore();
            
                }
            
                
        background(0);
        stroke(120);
        
}


void draw(){
    
    
    fill(0,0,0,15);
    rect(-1,-1,width+2,height+2);
    
    
    
    
    if(mousePressed){
        
        
        
        float pressline_r=0,pressline_g=255,pressline_b=0;
        onObject=false;
        
        if(mouseButton==LEFT)
            for(int i=0;i<barre.length;i++){
                if(barre[i]==null)
                    break;
                if(barre[i].isInside(mouseX,mouseY)){   
                    barre[i].aggiornaDimensioni();
                    barre[i].muovi(new PVector(mouseX-barre[i].xc,mouseY-barre[i].yc));
                    pressline_r=barre[i].r; pressline_g=barre[i].g; pressline_b=barre[i].b;
                    campoVett.aggiornaCampi();
                    onObject=true;
                    break;
                }
            }
        
        if(mouseButton==LEFT)
            for(int i=0;i<sfere.length;i++){
                if(sfere[i]==null || onObject)
                    break;
                if(sfere[i].isInside(mouseX,mouseY)){
                
                    sfere[i].aggiornaRaggio();
                    sfere[i].muovi(new PVector(mouseX-sfere[i].x,mouseY-sfere[i].y));
                    pressline_r=sfere[i].r; pressline_g=sfere[i].g; pressline_b=sfere[i].b;
                    onObject=true;
                    break;
                }
            }
        
        
        for(int i=0;i<lanciatori.length;i++){
            if(lanciatori[i]==null || onObject)
                break;
            if(!onObject && lanciatori[i].isInside(mouseX,mouseY)){
                if(mouseButton==LEFT){
                    lanciatori[i].aggiornaDimensioni();
                    lanciatori[i].muovi(new PVector(mouseX-lanciatori[i].xc,mouseY-lanciatori[i].yc));
                    pressline_r=lanciatori[i].r; pressline_g=lanciatori[i].g; pressline_b=lanciatori[i].b;
                    onObject=true;
                }
                else if(mouseButton==RIGHT){
                    if(lanciatori[i].isOn)
                        lanciatori[i].isOn=false;
                    else 
                        lanciatori[i].isOn=true;
                        
                }
                break;
            }
        }
        
        
        stroke(pressline_r,pressline_g,pressline_b);
        line(mouseX,0,mouseX,height);
        line(0,mouseY,width,mouseY);
                
        
    }
    
    else {
        stroke(255,0,0,125);
        line(mouseX,0,mouseX,height);
        line(0,mouseY,width,mouseY);
    }
    
    
    for(int i=0;i<barre.length;i++){
        if(barre[i]==null)
            break;
        barre[i].disegnami();
    }
    
    
    for(int i=0;i<sfere.length;i++){
        if(sfere[i]==null)
            break;
        sfere[i].disegnami();
    }
    
    
    for(int i=0;i<lanciatori.length;i++)
        if(lanciatori[i]==null)
            break;
        else
            lanciatori[i].disegnami();
            
    
    for(int i=0;i<lanciatori.length;i++){
        if(lanciatori[i]==null)
            break;
        Spawned[] spawnati=lanciatori[i].getSpawnati();
        if(spawnati!=null)
            for(int j=0;j<spawnati.length;j++){
                if(spawnati[j]==null)
                    break;
                
                float k=(float)Math.random();
                int xCoordInt=(int)spawnati[j].xc;
                xCoordInt = (xCoordInt>=width) ? width-1 : xCoordInt;
                xCoordInt = (xCoordInt<0) ? 0 : xCoordInt;
                
                int yCoordInt=(int)spawnati[j].yc;
                yCoordInt = (yCoordInt>=height) ? height-1 : yCoordInt;
                yCoordInt = (yCoordInt<0) ? 0 : yCoordInt; 
                
                
                
                int xForce=campoVett.xForce[yCoordInt][xCoordInt];
                int yForce=campoVett.yForce[yCoordInt][xCoordInt];
                
                spawnati[j].sommaPVector(new PVector(0.1*k*(sfere[i].x-spawnati[j].xc),0.1*k*(sfere[i].y-spawnati[j].yc)));
                spawnati[j].sommaPVector(new PVector(k*0.2*xForce,k*0.2*yForce));
                spawnati[j].disegnami();
                
            }
            
        if(lanciatori[i].isOn)
                lanciatori[i].lancia();
        
        
    }
    
    
    
    
    
}


void mouseReleased(){
    //bruteforce verso tutti
    
    for(int i=0;i<barre.length;i++){
        if(barre[i]==null)
            break;
        barre[i].resetDimensioni();
    }

    for(int i=0;i<lanciatori.length;i++){
        if(lanciatori[i]==null)
            break;
        lanciatori[i].resetDimensioni();
    }
    
    for(int i=0;i<sfere.length;i++){
        if(sfere[i]==null)
            break;
        sfere[i].resetRaggio();
    }
}





