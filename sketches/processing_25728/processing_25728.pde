

void restart() {

  n = new ArrayList(0);
  num = (int)((width/res*height/res));


  blobX = width/2;
  blobY = height/2;

  X = 0;
  Y = 0;

  //randomSeed(200);

  for(int i = 0 ; i < num ; i++) {
    n.add(new Neuron(i,(int)(random(avgConnections)+1)));
  }

  hand = new ArrayList();

  for(int i = 0;i<chapadlaNum;i++) {
    hand.add(new Hand(i,(int)(chapadlaLen),blobX,blobY));
  }
}

void keyPressed() {
  restart();
}

void mousePressed() {
  control = true;
  
}

void mouseReleased(){
   control = false; 
  
}

void cont(){
 
  for(int q =0;q<1;q++) {
    Hand learn = (Hand)hand.get(q);
    for(int i =0;i<learn.bones.size();i++) {
      Bone b = (Bone)learn.bones.get(i);
      b.writeNeurons();
    }
  } 
}


