
class collision {
  
  line[] lines= new line[0];

  int total;

  collision(line[] lines) {
    this.lines = lines;
    total = lines.length;
  }

  void add_line(line new_line) {
    lines = (line[]) append(lines, new_line);
    total++;
  }

  float[] temp = new float[2];

  void of_lines() {


    for ( int x=0; x< total; x++) {

      if ((lines[x].end.x <0)||(lines[x].end.x>width)||(lines[x].end.y <0)||(lines[x].end.y>height) ) {
        lines[x].collision = true;
      }

      for ( int y=0; y< total; y++) {

        if ( ! lines[x].collision) {

          if (x != y) {
            temp =collision_line_line(lines[x].start.x, lines[x].start.y, lines[x].end.x, lines[x].end.y, lines[y].start.x, lines[y].start.y, lines[y].end.x, lines[y].end.y);

            if ( temp != null) {

              if ( ( abs(temp[0])-abs(lines[x].end.x)  < 5) && (abs(temp[1])-abs(lines[x].end.y) <5 )) {
                lines[x].collision();
              }
            }
          }
        }
      }
    }
  }
}


