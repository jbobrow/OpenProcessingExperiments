

  noStroke();
  size(600, 600);

   for (int i=0; i<50; i=i+1) {
    if (i%2==0) { // si "i" es numero par...
      fill(255); // rellene blanco
    }
    else { // si no,
      fill(0); // rellene negro
    }
    ellipse(300, 300, width-(i*10), width-(i*10));
}
