{
  description = "OpenType Math layout and rendering engine in Racket";

  outputs = { self, nixpkgs }:
  let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    # TODO: add some other command that reproduces the exmaple output
    # (probably by invoking racket with the corret expression as an argument)
    devShell."x86_64-linux" = pkgs.mkShell {
      buildInputs = with pkgs; [
        racket # TODO: add minor changes to racket/draw
               # (as a patch or by changing src attribute of the package to the desired version)

        harfbuzz # TODO: update to 3.4.0 or otherwise include https://github.com/harfbuzz/harfbuzz/pull/3416
                 # (probably by changing the src attribute of the pakage)

        lmodern # TODO: add other supported fonts as dependencies
                # TODO: apply fix-lm-metrics.py to specifically to lmodern
                # (run script in hook after correct build step)
                # TODO: apply eliminate-math-script.py
                # (run script in hook after correct build step for all supported fonts )
      ];
    };
  };
}
