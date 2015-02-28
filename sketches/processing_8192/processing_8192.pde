
float[] massSums = {0,0,0};
PVector CM;

//finding the center of mass
void findCM(){
  massSums[0] = 0;
  massSums[1] = 0;
  massSums[2] = 0;
  for(int i=0; i<galaxies.length; i++){
    for(int j=0; j<galaxies[i].nMyParticles;j++){
      massSums[0]+= galaxies[i].particles[j].position.x;
      massSums[1]+= galaxies[i].particles[j].position.y;
      massSums[2]+= galaxies[i].particles[j].position.z;
    }
  }

  CM = new PVector(massSums[0]/nParticles,
                   massSums[1]/nParticles,
                   massSums[2]/nParticles);
}


