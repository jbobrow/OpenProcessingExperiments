
void setup(){
    frameRate (20);
    size(500,500);
    predatorP{140,30}
    preyP={150,350}
    rectMode(CENTER);
    }
void draw(){
    background(204);
    if(predatorP[0]>preyP[0])
    predetorP[0]--;
    else if(predetorP[0]<preyP[0])
        predatorP[0]++;
     
    if(prayP[0] != predatorP[0]){   
    slant = (preyP[1]-predatorP[1])/(preyP[0]-predatorP[0]);
    if(predatorP[1]>preyP[1]
        oredatorP[1]-=abs(slant);
    else if(predatorP[1]<preyP[1])
    predatorP[1]+=abs(slant);
    }
    predator=rect(predatorP[0],predatorP[1],20,20);
    prey=elliopse(preyP[0],preyP[1],20,20;
    }
    
    //マジでわかりません
