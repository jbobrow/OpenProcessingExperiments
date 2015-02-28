
void keyPressed() {
  if (key==' ') {
    initPhysics();
    generateModel();
  }
  if (key=='u') updateM=!updateM;
  if (key=='l') new LaplacianSmooth().filter(mesh, 1);
  if (key=='s') {//a little bonus:
    SubdivisionStrategy subdiv;
   // subdiv=new MidpointDisplacementSubdivision(mesh.computeCentroid(),-1.5f);
    subdiv=new NormalDisplacementSubdivision(-1.0f);
    mesh.subdivide(subdiv,10);
    //new LaplacianSmooth().filter(mesh, 1);
  }
}


