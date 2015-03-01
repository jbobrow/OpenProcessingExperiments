
  noStroke();
  size(4000,2000);

   for (int i=0; i<30; i=i+1) {
    if (i%8==0) { // si "i" es numero par...
      fill(255); // rellene blanco
    }
    else { // si no,
      fill(0); // rellene negro
    }
    ellipse(300, 300, width-(i*10), width-(i*10));
}
