
private int speed=1;
private int moveSpeed=5;
private short[] eyeColor;
private boolean dir=false; // false - up, true - down

private int x,y;
    
    public void setup(){
        size(screen.width/2,screen.height/2);
        eyeColor = new short[3];
        for(int i=0;i<eyeColor.length;i++)
            eyeColor[i]=0;
        
        x=60;
        y=60;
    }
    
    public void draw(){
        background(0);
        if(dir){
            if(eyeColor[0]>0 && eyeColor[0]<=255)
                eyeColor[0]-=speed;
            else
                if(eyeColor[1]>0 && eyeColor[1] <=255)
                    eyeColor[1]-=speed;
                else if(eyeColor[2]>0 && eyeColor[2] <=255)
                    eyeColor[2]-=speed;
                else
                    dir=!dir;
                    
        }
        else
            if(eyeColor[0]>=0 && eyeColor[0]<255)
                eyeColor[0]+=speed;
            else
                if(eyeColor[1]>=0 && eyeColor[1] <255)
                    eyeColor[1]+=speed;
                else if(eyeColor[2]>=0 && eyeColor[2] <255)
                    eyeColor[2]+=speed;
                else
                    dir=!dir;
        
        drawHead();
    }
    
    private void drawHead(){
        fill(255);
        stroke(255);
        ellipse(x,y,50,50);
        
        fill(eyeColor[0],eyeColor[1],eyeColor[2]);
        ellipse(x-10,y-10,10,10);
        ellipse(x+10,y-10,10,10);
    }
    
    public void keyPressed(){
        if(key=='a')
            x-=moveSpeed;
        if(key=='d')
            x+=moveSpeed;
        if(key=='w')
            y-=moveSpeed;
        if(key=='s')
            y+=moveSpeed;
    }

