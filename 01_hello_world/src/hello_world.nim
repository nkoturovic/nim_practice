import result, options

func safeDiv(x : int, y: int): Option[int] =
  return case y:
    of 0: int.none # <=> none(int)
    else: (x div y).some # <=> some(x div y)


func safeDivMsg(x : int, y: int): Result[int, string] =
  return case y:
    of 0: err("Division by zero")
    else: ok(x div y)

func safeDivTwiceMsg(x : int, y: int): Result[int, string] =
  x.safeDivMsg(y).get.safeDivMsg(y)

when isMainModule:
  echo("Hello, World!")
  echo 4.safeDiv(2).get.safeDiv(2).get;
  echo 4.safeDivMsg(2).get().safeDivMsg(0);
  echo 4.safeDivTwiceMsg(0).get()
  
