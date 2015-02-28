
void BuildMesh() {
  //Loop over the stored nodes
  for (int i = 0; i < Cells; i ++ ) {
    for (int j = 0; j < TrailsCollection.size(); j ++ ) {
      TrailNode T1 = (TrailNode)TrailsCollection.get(j);
      //Loop over the nodes again
      for (int k = 0; k < Cells; k ++ ) {
        for (int l = 0; l < TrailsCollection.size(); l ++ ) {
          TrailNode T2 = (TrailNode)TrailsCollection.get(l);

          // Compare the nodes
          float distance = T1.Tloc.dist(T2.Tloc);
          if (distance>gridSize/2 && distance<2*gridSize) {
            stroke (255, 70);
            strokeWeight(1);
            line(T1.Tloc.x, T1.Tloc.y, T1.Tloc.z, T2.Tloc.x, T2.Tloc.y, T2.Tloc.z);
          }
        }
      }
    }
  }
}

void drawNodes() {
    for (int i = 0; i < TrailsCollection.size(); i ++ ) {
      TrailNode T = (TrailNode)TrailsCollection.get(i);
      T.run();
    }
  }

