
function preload(){
  var s = document.createElement( 'script' );
  s.setAttribute( 'src', "https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.3.16/p5.js" );
  document.head.appendChild( s );
}

function setup() {
  createCanvas(640, 480);
}

function draw() {
  ellipse(50, 50, 80, 80);
}
