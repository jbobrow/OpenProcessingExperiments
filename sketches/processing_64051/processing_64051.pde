
void cantinho () {
  background (255);
  for ( int i = 0; i < player.bufferSize() - 1; i++ ) {
    fill(0);
    stroke (255);
    rect (0, height/2- player.left.get(i)*100, 100, 100);
    rect (0- player.left.get(i)*100, 100, 100, 100);
    rect (0, 900, 100- player.left.get(i)*80, 100- player.left.get(i)*80);
  }
}


