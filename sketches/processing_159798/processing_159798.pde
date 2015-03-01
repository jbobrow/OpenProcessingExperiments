
var balls = [];

var CELL_SIZE = 20;

void setup() {  //setup function called initially, only once
  size(600, 600);
  background(0);  //set background white
}

void draw() {  //draw function loops 
  balls = [];
  for(var i = 0; i < 12; i++) {
      balls.push({x: ((i + i * frameCount / 25) * 40) % width, y : (i + i*i*frameCount / 1000 * 190) % height, r: 25 + (i % 4) * 15});
  }
  var grid = [];
  background(0);
  noFill();
  stroke(255);
  for(var x = 0; x < width/CELL_SIZE; x++) {
      grid[x] = [];
      for(var y = 0; y < height/CELL_SIZE; y++) {
        var eval = evaluate(x*CELL_SIZE, y*CELL_SIZE);
        grid[x][y] = eval;
        fill(255);
        text(eval, x*CELL_SIZE, y*CELL_SIZE);
        //if(eval > 1) {
            noStroke();
            fill(map(eval, 0, 10, 0, 255), 128);
            rect(x*CELL_SIZE, y*CELL_SIZE, CELL_SIZE, CELL_SIZE);
        // }
        if(x > 0 && y > 0) {
            // when I complete myself I've just filled in the bottom-right corner; take a look at them
            var cellData = [grid[x-1][y-1], grid[x][y-1], grid[x][y], grid[x][y-1]];
            drawCellData(cellData, x, y);
        }
      }
  }
}

function drawCellData(cellData, x, y) {
  var cellIndex = (function (a, b, c, d) { return a*8 + b*4 + c*2 + d; }).apply(null, cellData.map(function(data) { return data > 1 ? 1 : 0 }));
  fill(255);
  
  // text(cellIndex, x*CELL_SIZE, y*CELL_SIZE);
}

function evaluate(x, y) {
  var sum = 0;
  function contrib(ball) {
    var dx = x - ball.x,
        dy = y - ball.y;
    return ball.r * ball.r / (dx * dx + dy * dy);
  }
  balls.forEach(function(ball) {
    sum += contrib(ball);
  });
  return sum;
}
