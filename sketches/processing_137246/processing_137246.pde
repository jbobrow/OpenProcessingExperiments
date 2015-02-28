
function math_random_int(a, b) {
  if (a > b) {
    // Swap a and b to ensure a is smaller.
    var c = a;
    a = b;
    b = c;
  }
  return Math.floor(Math.random() * (b - a + 1) + a);
}


while (!(math_random_int(1, 5) == math_random_int(1, 5))) {
  window.alert('LOOOLZ :)');
}
