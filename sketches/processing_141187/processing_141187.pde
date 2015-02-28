
//String rule="12345/456";
String rule="23/3";
String[] SB=rule.split("/");
String S=SB[0];
String B=SB[1];

int n=80;
int m=50;
int wh=10;
public Cell[][] grid=new Cell[n][m];

public void setup(){
    size(wh*n,wh*m);
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++){
            grid[i][j]=new Cell(i*wh,j*wh,wh,wh,random(35)>30);
        }
    }
   frameRate(10);
}

public void draw(){
    background(240);
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++){
            int test=countNeighbours(i,j);
            if(!grid[i][j].getState() && B.contains(""+test)) grid[i][j].setState(true);
            else if(grid[i][j].getState() && !S.contains(""+test)) grid[i][j].setState(false);
            if(i==n-1||i==0||j==m-1||j==0)grid[i][j].setState(true);
        }
    }    
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++){
            grid[i][j].draw();
        }
    }    
}

public void mouseClicked(){
    for(int i=0;i<n;i++){
        for(int j=0;j<m;j++){
            if(grid[i][j].isOver(mouseX,mouseY)){
                grid[i][j].setState(!grid[i][j].getState());
            }
            
        }
    }    
}


public int countNeighbours(int x,int y){
    int retval=0;
    retval+=grid[x-1<0?n-1:x-1][y-1<0?m-1:y-1].getState()?1:0;
    retval+=grid[x][y-1<0?m-1:y-1].getState()?1:0;
    retval+=grid[x+1==n?0:x+1][y-1<0?m-1:y-1].getState()?1:0;
    
    retval+=grid[x-1<0?n-1:x-1][y].getState()?1:0;
    retval+=grid[x+1==n?0:x+1][y].getState()?1:0;

    retval+=grid[x-1<0?n-1:x-1][y+1==m?0:y+1].getState()?1:0;
    retval+=grid[x][y+1==m?0:y+1].getState()?1:0;
    retval+=grid[x+1==n?0:x+1][y+1==m?0:y+1].getState()?1:0;

    return retval;
}

public class Cell{
    private int x,y;
    private int w=20;
    private int h=w;
    private boolean oldState;
    private boolean newState;
    public Cell(int x,int y,int w,int h,boolean state){
        this.x=x;
        this.y=y;
        this.w=w;
        this.h=h;
        this.newState=state;
        this.oldState=state;
    }
    
    public boolean getState(){
        return oldState;
    }
    
    public void setState(boolean inState){
        newState=inState;
    }
    
    public void draw(){
        oldState=newState;
        strokeWeight(0);
        stroke(oldState?10:220);
        fill(oldState?10:220,200);
        rect(x,y,w,h);
        if(isOver(mouseX,mouseY)){    
            fill(10,200,10,100);
            rect(x,y,w,h);    
        }
    }
    public boolean isOver(int mx,int my){
        if(mx>x&&mx<x+w&&my>y&&my<y+h)return true;
        return false;
    }
}
