
void AllDist() {
  for (int i = 0; i < NumOfSId; i++) {
    for (int j = 0;  j < NumOfSId; j++) {
      PVector A = new PVector(Sid[i].x, Sid[i].y, Sid[i].z);
      PVector B = new PVector(Sid[j].x, Sid[j].y, Sid[j].z);
      Sid[i].allDist[j][0] = PVector.dist(A, B);
      Sid[i].allDist[j][1] = Sid[j].x;
      Sid[i].allDist[j][2] = Sid[j].y;
      Sid[i].allDist[j][3] = Sid[j].z;
      if (Sid[i].allDist[j][0] < tol * Sid[i].ixodist) {
        Sid[i].homie[j] = true;
      } 
      else {
        Sid[i].homie[j] = false;
      }
    }
  }
}


