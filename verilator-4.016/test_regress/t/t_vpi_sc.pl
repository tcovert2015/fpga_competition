#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2010 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

scenarios(simulator => 1);

compile(
    # Must not make shell/main or hides bug
    make_top_shell => 0,
    make_main => 0,
    verilator_flags2 => ["--exe --vpi --sc $Self->{t_dir}/t_vpi_sc.cpp"],
);

execute(
    check_finished => 1
);

ok(1);
1;
