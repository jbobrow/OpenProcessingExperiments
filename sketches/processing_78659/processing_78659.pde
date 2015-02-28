

Agent[] allAgents = new Agent[100];
void setup(){

size (800,600);
background (50);

for (int i=0;i<allAgents.length; i++){
allAgents[i]= new Agent (new PVector(random (0,width), random(0,height)),i);
}
}
void draw () {

  fill (50,200);
  rect (0,0, width,height);
for (int i=0; i<allAgents.length; i++){
allAgents[i].drawAgent();
}

}

