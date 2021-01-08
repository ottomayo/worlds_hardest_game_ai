Level level;
Player test;


void setup() {
  size(800, 600);
  
  level = new Level(1);
  test = new Player();
  
}


void draw() {
  background(100, 100, 255);
  
  level.draw();
  test.update();
  test.show();
  
}
