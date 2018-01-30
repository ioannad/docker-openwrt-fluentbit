/* -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- */

/*  Fluent Bit
 *  ==========
 *  Copyright (C) 2015-2017 Treasure Data Inc.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#ifndef FLB_FILTER_PARSER_H
#define FLB_FILTER_PARSER_H

#include <fluent-bit/flb_info.h>
#include <fluent-bit/flb_parser.h>

#define FLB_PARSER_UNS_BUF_SIZE  4096

struct filter_parser_ctx {
    char   *key_name;
    int    key_name_len;
    int    reserve_data;
    int    unescape_key;

    /* Unescape buffer */
    int buf_size;
    int buf_len;
    char *buf_data;

    struct flb_parser *parser;
};

#endif /* FLB_FILTER_PARSER_H */