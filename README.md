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
4. result of $ mix run proj1.exs 100000 200000 <br/>
    102510 201 510 <br />
    104260 260 401 <br />
    105210 210 501 <br />
    105264 204 516 <br />
    105750 150 705 <br />
    108135 135 801 <br />
    110758 158 701 <br />
    115672 152 761 <br />
    116725 161 725 <br />
    117067 167 701 <br />
    118440 141 840 <br />
    120600 201 600 <br />
    123354 231 534 <br />
    124483 281 443 <br />
    125248 152 824 <br />
    125433 231 543 <br />
    125460 204 615 246 510 <br />
    125500 251 500 <br />
    126027 201 627 <br />
    126846 261 486 <br />
    129640 140 926 <br />
    129775 179 725 <br />
    131242 311 422 <br />
    132430 323 410 <br />
    133245 315 423 <br />
    134725 317 425 <br />
    135828 231 588 <br />
    135837 351 387 <br />
    136525 215 635 <br />
    136948 146 938 <br />
    140350 350 401 <br />
    145314 351 414 <br />
    146137 317 461 <br />
    146952 156 942 <br />
    150300 300 501 <br />
    152608 251 608 <br />
    152685 261 585 <br />
    153436 356 431 <br />
    156240 240 651 <br />
    156289 269 581 <br />
    156915 165 951 <br />
    162976 176 926 <br />
    163944 396 414 <br />
    172822 221 782 <br />
    173250 231 750 <br />
    174370 371 470 <br />
    175329 231 759 <br />
    180225 225 801 <br />
    180297 201 897 <br />
    182250 225 810 <br />
    182650 281 650 <br />
    186624 216 864 <br />
    190260 210 906 <br />
    192150 210 915 <br />
    193257 327 591 <br />
    193945 395 491 <br />
    197725 275 719 <br />
5. CPU time: 2.732 second <br />
   real time: .959 second <br />
   ratio: 2.85 <br />
6. mix run proj1.exs 10000000 20000000 (10 million to 20 million TESTED)

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/app1](https://hexdocs.pm/app1).

