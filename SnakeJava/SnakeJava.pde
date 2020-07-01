Snake s;
int scale = 20;
PVector food;


void setup() {
size(500,500);
s = new Snake();
frameRate(10);
pickLocation();
}


void pickLocation() {
int cols = (width/scale);
int rows = (height/scale);
food = new PVector(floor(random(cols)), floor(random(rows)));
food.mult(scale);
}


void draw() {
background(20);

if(s.eat(food)){
pickLocation();
}
s.update();
s.show();

fill(255,0,120);
rect(food.x, food.y, scale, scale);
}

void keyPressed() {
if (keyCode == UP){
  s.dir(0,-1);
 }
 if (keyCode == DOWN){
  s.dir(0,1);
 }
 if (keyCode == RIGHT){
  s.dir(1,0);
 }
 if (keyCode == LEFT){
  s.dir(-1,0);
 }
 
}
