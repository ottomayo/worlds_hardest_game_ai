class Player {
  Brain brain;
  
  PVector pos;
  PVector vel;
  PVector acc;
  
  boolean dead = false;
  boolean reachedGoal = false;
  
  Player() {
    pos = new PVector(60, 60);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    brain = new Brain(300);
    
  }
  
  void show() {
    fill(255,0,0);
    stroke(0);
    rect(pos.x, pos.y, 10, 10);
  }
  
  
  void update() {
    if(!dead && !reachedGoal) {
      
      if(level.insideArea(pos.x, pos.y)) {
        move();
      }
      
    }
    
  }
  
  void move() {
    if(brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step += 1;
    } else {
      dead = true;
    }
    
    vel.add(acc);
    vel.limit(2);
    
    pos.add(vel);
  }
  
  
  
  
}
