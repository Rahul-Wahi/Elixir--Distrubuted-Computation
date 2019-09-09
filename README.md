# App1

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `app1` to your list of dependencies in `mix.exs`:

NAME 1: Rahul Wahi
UFID: 3053-6162

NAME 2: Mohit Garg
UFID: 9013-4089

*************************************************************************************************************************
1. **STEPS to run the code**
  
step1: Unzip the file and enter in the proj1 folder through terminal($cd proj1) where mix.exs file is present.

step2:run the command ($mix run proj1.exs 100000 200000) to execute the file. You may enter any number range inplace of 100000 and 200000.

**************************************************************************************************************************

2. Number of worker actor is 1200
3. Size of work unit of each worker is equally distributed. Example: input size is 1 million. So, Size of each work unit=1000000/1200.      So, Each worker will execute 833 vampire numbers.
4. result of $ mix run proj1.exs 100000 200000
    102510 201 510
    104260 260 401
    105210 210 501
    105264 204 516
    105750 150 705
    108135 135 801
    110758 158 701
    115672 152 761
    116725 161 725
    117067 167 701
    118440 141 840
    120600 201 600
    123354 231 534
    124483 281 443
    125248 152 824
    125433 231 543
    125460 204 615 246 510
    125500 251 500
    126027 201 627
    126846 261 486
    129640 140 926
    129775 179 725
    131242 311 422
    132430 323 410
    133245 315 423
    134725 317 425
    135828 231 588
    135837 351 387
    136525 215 635
    136948 146 938
    140350 350 401
    145314 351 414
    146137 317 461
    146952 156 942
    150300 300 501
    152608 251 608
    152685 261 585
    153436 356 431
    156240 240 651
    156289 269 581
    156915 165 951
    162976 176 926
    163944 396 414
    172822 221 782
    173250 231 750
    174370 371 470
    175329 231 759
    180225 225 801
    180297 201 897
    182250 225 810
    182650 281 650
    186624 216 864
    190260 210 906
    192150 210 915
    193257 327 591
    193945 395 491
    197725 275 719
5. CPU time: 2.732 second
   real time: .959 second
   ratio: 2.85
6. mix run proj1.exs 10000000 20000000 (10 million to 20 million TESTED)
7.

```elixir
def deps do
  [
    {:app1, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/app1](https://hexdocs.pm/app1).

